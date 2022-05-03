//
//  Number.swift
//  TipJar
//
//  Created by Azhar Islam on 27/04/2022.
//

import Foundation

/// Currency formatter

extension Double {
    func toDollarString() -> String {
        return String(format: "$%.2f",self)
    }
}
