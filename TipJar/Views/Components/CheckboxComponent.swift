//
//  CustomCheckboxView.swift
//  TipJar
//
//  Created by Azhar Islam on 29/04/2022.
//

import SwiftUI

/// Re-usable checkbox view

struct CheckboxComponent: ButtonStyle {
    enum Attributes {
        case `default`
        
        var isBordered: Bool {
            switch self {
            case .default:
                return true
            }
        }
        
        func borderColor(_ isSelected: Bool) -> Color {
            switch self {
            case .default:
                return isSelected ? Color.checkboxOrange : Color.checkboxGray
            }
        }
    }
    
    public var attribute: Attributes = .default
    public var isSelected: Bool = false
    
    public func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .frame(width: 31, height: 31)
            .overlay(
                RoundedRectangle(cornerRadius: 7)
                    .stroke(attribute.borderColor(isSelected), lineWidth: attribute.isBordered ? 1 : 0)
            )
    }
}
