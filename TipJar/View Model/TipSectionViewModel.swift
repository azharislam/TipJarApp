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
    
    @Published var showPaymentsView: Bool? = false
    @Published var isKeyboardEnabled: Bool = false
    @Published var savedPayments: [SavedPayment] = []
    @Published var image: UIImage?
    @Published var peopleCount: Int = 1
    @Published var totalTip: Double = 0.0
    @Published var perPersonAmount: Double = 0.0
    @Published var amount: Double = 0.0
    @Published var enteredAmount: String = "" {
        didSet {
            amount = (enteredAmount.isEmpty ? defaultValue : Double(enteredAmount)) ?? 0.0
        }
    }
    
    private let manager = DatabaseManager.instance
    private var cancellables = Set<AnyCancellable>()
    private let defaultValue: Double = 100.00
    let tipPercentage: Double = 10.0/100.0
    var savedPayment: SavedPayment?
    
    init() {
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
    
    var amountString: String {
        amount.toDollarString()
    }
    
    var totalTipString: String {
        totalTip.toDollarString()
    }
    
    var perPersonAmountString: String {
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
    
    func addPayment(totalAmount: String, totalTip: String, image: String = "") {
        let newPayment = SavedPayment(context: manager.context)
        newPayment.id = UUID()
        newPayment.savedDate = Date()
        newPayment.savedAmount = totalAmount
        newPayment.totalTip = totalTip
        newPayment.savedImage = image
        saveData()
        print("\(savedPayments.count)")
    }
    
    private func savePayment() {
        $image.sink { [weak self] image in
            guard let self = self else { return }
            guard let image = image else { return }
            let imageUuid = UUID().uuidString
            ImageFileManager.saveImage(imageUuid, image: image) { error in
                if error != nil {
                    print("Error saving image")
                }
            }
            self.addPayment(totalAmount: self.amountString, totalTip: self.totalTipString, image: ImageFileManager.imageName)
            self.showPaymentsView = true
            self.enteredAmount = Constants.App.emptyString
        }
        .store(in: &cancellables)
    }
    
    private func getPayments() {
        let request = NSFetchRequest<SavedPayment>(entityName: "SavedPayment")
        
        do {
            savedPayments = try manager.context.fetch(request)
        } catch let error {
            print("Error fetching data. \(error.localizedDescription)")
        }
    }
    
    private func saveData() {
        manager.saveData()
    }
}
