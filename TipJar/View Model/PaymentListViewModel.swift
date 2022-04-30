//
//  PaymentListViewModel.swift
//  TipJar
//
//  Created by Azhar Islam on 30/04/2022.
//

import Foundation

final class PaymentListViewModel: ObservableObject {
    
    var payment: SavedPayments
    
    init(payment: SavedPayments) {
        self.payment = payment
    }
    
    // MARK: - Abstract Variables

    var savedDate: String {
        payment.savedDate?.customDate ?? ""
    }

    var savedImage: String {
        payment.savedImage ?? ""
    }

    var amount: Double {
        payment.totalAmount
    }

    var tipAmount: String {
        "Tip: \(payment.totalTip)"
    }
}
