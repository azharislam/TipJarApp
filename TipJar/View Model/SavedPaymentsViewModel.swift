//
//  SavedPaymentsViewModel.swift
//  TipJar
//
//  Created by Azhar Islam on 28/04/2022.
//

import SwiftUI

class SavedPaymentsViewModel: ObservableObject {
    
    @State var receipt: Receipt?

    var savedDate: String {
        receipt?.savedDate.default ?? ""
    }
    var totalAmount: Double {
        receipt?.totalAmount ?? 0.0
    }

    var tipAmount: String {
        "Tip: $\(receipt?.tipAmount ?? 0.0)"
    }
    
    var savedImage: String {
        receipt?.savedImage ?? ""
    }
}
