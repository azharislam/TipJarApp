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
        case peopleCount
        case tip
    }
    
    let type: FieldType
    var placeHolder: String?
    @State var textField: String = ""
    
    var body: some View {
        fieldSection
    }
    
    @ViewBuilder private var fieldSection: some View {
        switch type {
        case .amount:
            amountField
        case .peopleCount:
            peopleCount
        case .tip:
            tipField
        }
    }
    
    private var amountField: some View {
        VStack(alignment: .leading) {
            Text("Enter amount")
                .font(Font.Roboto.medium(size: 16))
                .padding(.bottom)
            if let placeHolder = placeHolder {
                TextField(placeHolder, text: $textField)
                    .font(Font.Roboto.medium(size: 42))
                    .multilineTextAlignment(.center)
                    .padding()
                    .frame(width: 330, height: 80)
                    .overlay(RoundedRectangle(cornerRadius: 12)
                        .stroke(Color.gray, lineWidth: 0.5)
                        .shadow(color: Color.black, radius: 10, x: 2, y: 2))
                    .overlay(alignment: .leading) {
                        Text("$")
                            .font(Font.Roboto.medium(size: 24))
                            .padding(.leading, 20)
                    }
            }
        }
    }
    
    private var peopleCount: some View {
        VStack(alignment: .leading) {
            Text("How many people?")
                .font(Font.Roboto.medium(size: 16))
                .padding(.bottom)
            // Put number of people section inside here
        }
    }
    
    private var tipField: some View {
        VStack(alignment: .leading) {
            Text("% TIP")
                .font(Font.Roboto.medium(size: 16))
                .padding(.bottom)
            if let placeHolder = placeHolder {
                TextField(placeHolder, text: $textField)
                    .font(Font.Roboto.medium(size: 42))
                    .multilineTextAlignment(.center)
                    .padding()
                    .frame(width: 330, height: 80)
                    .overlay(RoundedRectangle(cornerRadius: 12)
                        .stroke(Color.gray, lineWidth: 0.5)
                        .shadow(color: Color.black, radius: 10, x: 2, y: 2))
                    .overlay(alignment: .trailing) {
                        Text("%")
                            .font(Font.Roboto.medium(size: 24))
                            .padding(.trailing, 10)
                    }
            }
        }
    }
}

struct AmountFieldView_Previews: PreviewProvider {
    static var previews: some View {
        AmountFieldView(type: .amount, placeHolder: "100.00")
    }
}
