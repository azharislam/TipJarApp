//
//  Receipt.swift
//  TipJar
//
//  Created by Azhar Islam on 28/04/2022.
//

import Foundation

struct Receipt: Identifiable {
    var id = UUID()
    var savedDate: Date
    var totalAmount: Double
    var tipAmount: Double
    var savedImage: String
    
    init(savedAmount: Double, savedTip: Double, savedImage: String) {
        self.id = UUID()
        self.savedDate = Date()
        self.totalAmount = savedAmount
        self.tipAmount = savedTip
        self.savedImage = savedImage
    }
}
