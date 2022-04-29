//
//  Date.swift
//  TipJar
//
//  Created by Azhar Islam on 28/04/2022.
//

import Foundation

extension DateFormatter {

    static func formatString(_ format: String) -> DateFormatter {
        let formatter: DateFormatter = DateFormatter()
        formatter.dateFormat = format
        return formatter
    }
    
    static let `default` = DateFormatter.formatString("yyyy MMM dd")
}

extension Date {
    
    var `default`: String {
        DateFormatter.default.string(from: self)
    }
}
