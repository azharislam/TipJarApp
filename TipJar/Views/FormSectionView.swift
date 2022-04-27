//
//  AmountFieldView.swift
//  TipJar
//
//  Created by Azhar Islam on 26/04/2022.
//

import SwiftUI

struct FormSectionView: View {
    
    enum SectionType {
        case amount
        case peopleCount
        case tip
        case totalTip
        case perPerson
        case checkbox
        case saveButton
    }
    
    let type: SectionType
    var placeHolder: String?
    @State var textField: String = ""
    
    var body: some View {
        formSection
    }
    
    @ViewBuilder private var formSection: some View {
        switch type {
        case .amount:
            amountField
        case .peopleCount:
            peopleCount
        case .tip:
            tipField
        case .totalTip:
            totalTip
        case .perPerson:
            perPerson
        case .checkbox:
            checkbox
        case .saveButton:
            saveButton
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
                        .stroke(Color.borderGray, lineWidth: 0.5)
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
                .padding(.leading, 30)
            HStack {
                Button(action: {}) {
                    Image.plus
                }
                .frame(width: 71, height: 71)
                .background(.clear)
                .clipShape(Circle())
                .overlay(
                    Circle()
                        .stroke(Color.countGrayBorder, lineWidth: 1)
                )
                .padding(.leading, 30)
                
                Spacer()
                
                Text("1")
                    .font(Font.Roboto.medium(size: 42))
                
                Spacer()
                
                Button(action: {}) {
                    Image.minus
                }
                .frame(width: 71, height: 71)
                .background(.clear)
                .clipShape(Circle())
                .overlay(
                    Circle()
                        .stroke(Color.countGrayBorder, lineWidth: 1)
                )
                .padding(.trailing, 30)
            }
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
                        .stroke(Color.borderGray, lineWidth: 0.5)
                        .shadow(color: Color.black, radius: 10, x: 2, y: 2))
                    .overlay(alignment: .trailing) {
                        Text("%")
                            .font(Font.Roboto.medium(size: 24))
                            .padding(.trailing, 10)
                    }
            }
        }
    }
    
    private var totalTip: some View {
        HStack {
            Text("Total Tip")
                .font(Font.Roboto.medium(size: 16))
                .padding(.leading, 30)
            Spacer()
            Text("$10.00")
                .font(Font.Roboto.medium(size: 16))
                .padding(.trailing, 30)
        }
    }
    
    private var perPerson: some View {
        HStack {
            Text("Per Person")
                .font(Font.Roboto.medium(size: 24))
                .padding(.leading, 30)
            Spacer()
            Text("$10.00")
                .font(Font.Roboto.medium(size: 24))
                .padding(.trailing, 30)
        }
    }
    
    private var checkbox: some View {
        HStack {
            
        }
    }
    
    private var saveButton: some View {
        HStack {
            
        }
    }
}

struct AmountFieldView_Previews: PreviewProvider {
    static var previews: some View {
        FormSectionView(type: .perPerson)
    }
}
