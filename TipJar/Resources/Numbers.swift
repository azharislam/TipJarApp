//
//  Number.swift
//  TipJar
//
//  Created by Azhar Islam on 27/04/2022.
//

import Foundation

// Add logic here that will handle string to decimal and currency logic

extension Double {
    func toString() -> String {
        return String(format: "%.2f",self)
    }
}
