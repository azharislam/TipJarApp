//
//  AmountFieldView.swift
//  TipJar
//
//  Created by Azhar Islam on 26/04/2022.
//

import SwiftUI

struct AmountFieldView: View {
    
    enum FieldType {
        case amount
        case tip
    }
    
    let type: FieldType
    var placeHolder: String
    @State var textField: String = ""
    
    var body: some View {
        HStack {
            fieldSection
        }
    }
    
    @ViewBuilder private var fieldSection: some View {
        switch type {
        case .amount:
            amountField
        case .tip:
            tipField
        }
    }
    
    private var amountField: some View {
        TextField(placeHolder, text: $textField)
            .font(.system(size: 42))
            .multilineTextAlignment(.center)
            .padding()
            .frame(width: 330, height: 80)
            .overlay(RoundedRectangle(cornerRadius: 12)
                .stroke(Color.gray, lineWidth: 0.5)
                .shadow(color: Color.black, radius: 10, x: 2, y: 2))
            .overlay(alignment: .leading) {
                Text("$")
                    .font(.system(size: 24))
                    .padding()
            }
    }
    
    private var tipField: some View {
        TextField(placeHolder, text: $textField)
            .font(.system(size: 42))
            .multilineTextAlignment(.center)
            .padding()
            .frame(width: 330, height: 80)
            .overlay(RoundedRectangle(cornerRadius: 12)
                .stroke(Color.gray, lineWidth: 0.5)
                .shadow(color: Color.black, radius: 10, x: 2, y: 2))
            .overlay(alignment: .trailing) {
                Text("%")
                    .font(.system(size: 24))
                    .padding()
            }
    }
}

struct AmountFieldView_Previews: PreviewProvider {
    static var previews: some View {
        AmountFieldView(type: .tip, placeHolder: "10")
    }
}
