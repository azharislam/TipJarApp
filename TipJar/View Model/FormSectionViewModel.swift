//
//  FormSectionViewModel.swift
//  TipJar
//
//  Created by Azhar Islam on 27/04/2022.
//

import Foundation
import SwiftUI
import Combine


final class FormSectionViewModel: ObservableObject {
    
    private var cancellables = Set<AnyCancellable>()
    
    @Published private(set) var receipts = [Receipt]()
    @Published var peopleCount: Int = 1
    @Published var totalTip: Double = 0.0
    @Published var perPersonAmount: Double = 0.0
    @Published var amount: Double = 0.0
    @Published var enteredAmount: String = "" {
        didSet {
            amount = (enteredAmount.isEmpty ? defaultValue : Double(enteredAmount)) ?? 0.0
        }
    }
    private let defaultValue: Double = 100.00
    private let tipPercentage: Double = 10.0/100.0
    @Published var isSaved: Bool = false
    
    init() {
       //when i call calculate tip inside here, the array resets to no elements
        //when i put saveTip() here, i get my new PaymentList view to succesfully display elements but all attributes are 0, as its being called twice, once in init
        // and once in the saveButton logic in the FormSectionView
    }
    
    var moreThanOnePerson: Bool {
        peopleCount > 1
    }
    
    var peopleCountDouble: Double {
        Double(peopleCount)
    }
    
    func calculateTip() {
        $enteredAmount
            .sink { [weak self] enteredAmount in
                guard let self = self else { return }
                self.totalTip = self.amount * self.tipPercentage
                self.perPersonAmount = self.totalTip / self.peopleCountDouble
                print("\(self.receipts.count)")
            }
            .store(in: &cancellables)
    }
    
    func calculateTip(amount: String) {
        self.enteredAmount = amount
        $enteredAmount
            .sink { [weak self] enteredAmount in
                guard let self = self else { return }
                self.totalTip = self.amount * self.tipPercentage
                self.perPersonAmount = self.totalTip / self.peopleCountDouble
                print("\(self.receipts.count)")
            }
            .store(in: &cancellables)
    }
    
    func saveTip() {
        print("Saved amount is \(amount)")
        print("Saved tip is \(totalTip)")
        let receipt = Receipt(savedAmount: amount, savedTip: totalTip, savedImage: "")
        receipts.append(receipt)
        print("\(receipts.count)")
    }
    
    func addSavedPayment(receipt: Receipt) {
        self.receipts.append(receipt)
        print("\(self.receipts.count)")
    }
}
