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
    @Published var enteredAmount: String = "" {
        didSet {
        amount = (enteredAmount.isEmpty ? defaultValue : Double(enteredAmount)) ?? 0.0
        }
    }
    @Published var peopleCount: Int = 1
    @Published var peopleCountDouble: Double = 0.0
    @Published var totalTip: Double = 0.0
    @Published var perPersonAmount: Double = 0.0
    @Published var amount: Double = 0.0
    private let defaultValue: Double = 100.00
    private let tipPercentage: Double = 10.0/100.0
    
    init() {
        calculateTip()
    }

    var moreThanOnePerson: Bool {
        peopleCount > 1
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
}
