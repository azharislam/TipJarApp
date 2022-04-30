//
//  KeyboardComponent.swift
//  TipJar
//
//  Created by Azhar Islam on 29/04/2022.
//

import SwiftUI
import Combine

/// Re-usable custom keyboard with Done button
/// In use until native solution with SwiftUI for Number/Decimal keypads

public struct KeyboardComponent: View {
    
    private let actionTitle: String
    private let onCompletion: (() -> Void)?
    
    public init(actionTitle: String, onCompletion: (() -> Void)? = nil) {
        self.actionTitle = actionTitle
        self.onCompletion = onCompletion
    }
    
    public var body: some View {
        HStack {
            Spacer()
            Button(actionTitle) {
                hideKeyboard()
                onCompletion?()
            }
            .padding(.trailing, 20)
            .padding(.leading)
            .frame(width: 100, height: 30)
            .font(Font.Roboto.bold(size: 18))
            .background(Color.checkboxOrange)
            .foregroundColor(.white)
            .cornerRadius(5)
        }
        .padding()
        .frame(idealWidth: .infinity, maxWidth: .infinity,
               idealHeight: 42, maxHeight: 42,
               alignment: .center)
    }
}


struct KeyboardComponent_Previews: PreviewProvider {
    static var previews: some View {
        KeyboardComponent(actionTitle: "Done")
    }
}
