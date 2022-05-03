//
//  TipSectionViewModel.swift
//  TipJar
//
//  Created by Azhar Islam on 29/04/2022.
//

import Combine
import CoreData
import UIKit

final class TipSectionViewModel: ObservableObject {
    
    // MARK: - Variables
    @Published var isError: Bool = false
    @Published var showPaymentsView: Bool? = false
    @Published var isKeyboardEnabled: Bool = false
    @Published var savedPayments: [SavedPayment] = []
    @Published var image: UIImage?
    @Published var peopleCount: Int = 1
    @Published var totalTip: Double = 0.0
    @Published var perPersonAmount: Double = 0.0
    @Published var amount: Double = 0.0
    @Published var enteredAmount: String = Constants.App.emptyString {
        didSet {
            amount = (enteredAmount.isEmpty ? defaultValue : Double(enteredAmount)) ?? 0.0
        }
    }
    
    private let storage: CoreDataStoreManager
    private var cancellables = Set<AnyCancellable>()
    private let defaultValue: Double = 100.00
    let tipPercentage: Double = 10.0/100.0
    var savedPayment: SavedPayment?
    
    init(storage: CoreDataStoreManager) {
        self.storage = storage
        getPayments()
        savePayment()
    }
    
}

// MARK: - Validator Variables

extension TipSectionViewModel {
    
    var peopleCountDouble: Double {
        Double(peopleCount)
    }
    
    var moreThanOnePerson: Bool {
        peopleCount > 1
    }
    
    var amountInDollar: String {
        amount.toDollarString()
    }
    
    var totalTipInDollar: String {
        totalTip.toDollarString()
    }
    
    var perPersonInDollar: String {
        perPersonAmount.toDollarString()
    }
}

// MARK: - Functions

extension TipSectionViewModel {
    
    func calculateTip() {
        $enteredAmount
            .sink { [weak self] enteredAmount in
                guard let self = self else { return }
                self.totalTip = self.amount * self.tipPercentage
                self.perPersonAmount = self.totalTip / self.peopleCountDouble
            }
            .store(in: &cancellables)
    }
    
    func validateUserInput(string: String) -> String {
        var userInput: String
        
        let groups = string.components(separatedBy: ".")
        if groups.count > 1 {
            userInput = groups[0] + "." + groups.dropFirst().joined()
        } else {
            userInput = string
        }
        
        userInput = userInput.filter { $0.isNumber || $0 == "." }
        
        if userInput.first == "." {
            userInput.removeFirst()
        }
        
        if userInput.first == "0" {
            var stringIndicesToRemove = [String.Index]()
            for index in 1..<userInput.count {
                let stringIndex = userInput.index(userInput.startIndex, offsetBy: index)
                if userInput[stringIndex] == "." {
                    break
                }
                
                stringIndicesToRemove.append(stringIndex)
            }
            
            for stringIndexToRemove in stringIndicesToRemove.reversed() {
                userInput.remove(at: stringIndexToRemove)
            }
        }
        
        return userInput
    }
    
    func getPayments() {
        let request = NSFetchRequest<SavedPayment>(entityName: Constants.DataModel.entity)
        
        do {
            savedPayments = try storage.context.fetch(request)
        } catch let error {
            print("Error fetching data. \(error.localizedDescription)") // Add some error alert views
        }
    }
    
    func addPayment(totalAmount: String, totalTip: String, image: String = Constants.App.emptyString) {
        let newPayment = SavedPayment(context: storage.context)
        newPayment.id = UUID()
        newPayment.savedDate = Date()
        newPayment.savedAmount = totalAmount
        newPayment.totalTip = totalTip
        newPayment.savedImage = image
        saveData()
    }
    
    private func savePayment() {
        $image.sink { [weak self] image in
            guard let self = self else { return }
            guard let image = image else { return }
            let imageUuid = UUID().uuidString
            ImageStoreManager.saveImage(imageUuid, image: image) { error in
                if error != nil {
                    self.isError = true
                }
            }
            self.addPayment(totalAmount: self.amountInDollar, totalTip: self.totalTipInDollar, image: ImageStoreManager.imageName)
            self.showPaymentsView = true
            self.enteredAmount = Constants.App.emptyString
        }
        .store(in: &cancellables)
    }
    
    private func saveData() {
        storage.saveData()
    }
}
