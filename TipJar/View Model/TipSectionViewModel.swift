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
    
    let manager = DatabaseManager.instance
    
    @Published var savedPayments: [SavedPayments] = []
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
    private var cancellables = Set<AnyCancellable>()
    private let defaultValue: Double = 100.00
    private let tipPercentage: Double = 10.0/100.0
    @Published var showPaymentsView: Bool? = false
    @Published var isKeyboardEnabled: Bool = false

    
    init() {
        getPayments()
    }
    
    func getPayments() {
        let request = NSFetchRequest<SavedPayments>(entityName: "SavedPayments")
        
        do {
            savedPayments = try manager.context.fetch(request)
        } catch let error {
            print("Error fetching data. \(error.localizedDescription)")
        }
    }
    
    func deletePayment(indexSet: IndexSet) {
        
    }
    
    func addPayment(totalAmount: Double, totalTip: Double, image: String) {
        let newPayment = SavedPayments(context: manager.context)
        newPayment.id = UUID()
        newPayment.savedDate = Date()
        newPayment.totalAmount = totalAmount
        newPayment.totalTip = totalTip
        newPayment.savedImage = image
        saveData()
        print("\(savedPayments.count)")
    }
    
    func saveData() {
        manager.saveData()
    }
    
    func calculateTip() {
        $enteredAmount
            .sink { [weak self] enteredAmount in
                guard let self = self else { return }
                self.totalTip = self.amount * self.tipPercentage
                self.perPersonAmount = self.totalTip / Double(self.peopleCount)
            }
            .store(in: &cancellables)
    }
    
    func savePayment() {
        $image.sink { [weak self] image in
            guard let self = self else { return }
            guard let image = image else { return }
            let imageUuid = UUID().uuidString
            ImageFileManager.saveImage(imageUuid, image: image) { error in
                if error != nil {
                    print("Error saving image")
                }
            }
            self.addPayment(totalAmount: self.amount, totalTip: self.totalTip, image: ImageFileManager.fileName)
            self.showPaymentsView = true
        }
        .store(in: &cancellables)
    }
    
    var moreThanOnePerson: Bool {
        peopleCount > 1
    }
    
}
