//
//  Date.swift
//  TipJar
//
//  Created by Azhar Islam on 28/04/2022.
//

import Foundation

/// Custom Date formatter

extension DateFormatter {

    static func formatString(_ format: String) -> DateFormatter {
        let formatter: DateFormatter = DateFormatter()
        formatter.dateFormat = format
        return formatter
    }
    
    static let `default` = DateFormatter.formatString(Constants.Symbols.dateFormat)
}

extension Date {
    
    var customDate: String {
        DateFormatter.default.string(from: self)
    }
}
