//
//  AmountFieldView.swift
//  TipJar
//
//  Created by Azhar Islam on 26/04/2022.
//

import SwiftUI

struct FormSectionView: View {

    @StateObject private var viewModel = FormSectionViewModel()

    enum SectionType {
        case amount
        case peopleCount
        case tip
        case summary
        case checkbox
        case saveButton
    }
    
    let type: SectionType
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
        case .summary:
            summarySection
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
            CustomTextfieldView {
                TextField("100.00", text: $textField)
                    .keyboardType(.decimalPad)
                    .frame(height: 80)
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
            HStack {
                Button(action: {
                    viewModel.peopleCount += 1
                }) {
                    Image.plus
                }
                .frame(width: 71, height: 71)
                .background(.clear)
                .clipShape(Circle())
                .overlay(
                    Circle()
                        .stroke(Color.countGrayBorder, lineWidth: 1)
                )
                
                Spacer()
                
                Text("\(viewModel.peopleCount)")
                    .font(Font.Roboto.medium(size: 42))
                
                Spacer()
                
                Button(action: {
                    if viewModel.peopleCountDecreased {
                        viewModel.peopleCount -= 1
                    }
                }) {
                    Image.minus
                }
                .frame(width: 71, height: 71)
                .background(.clear)
                .clipShape(Circle())
                .overlay(
                    Circle()
                        .stroke(Color.countGrayBorder, lineWidth: 1)
                )
            }
        }
    }
    
    private var tipField: some View {
        VStack(alignment: .leading) {
            Text("% TIP")
                .font(Font.Roboto.medium(size: 16))
            CustomTextfieldView {
                TextField("", text: $textField)
                    .keyboardType(.numberPad)
                    .frame(height: 80)
                    .overlay(alignment: .center, content: {
                        Text("10")
                            .font(Font.Roboto.medium(size: 42))
                    })
                    .overlay(alignment: .trailing) {
                        Text("%")
                            .font(Font.Roboto.medium(size: 24))
                            .padding(.trailing, 10)
                    }
            }
        }
        

    }
    
    private var summarySection: some View {
        VStack(spacing: 16) {
            HStack {
                Text("Total Tip")
                    .font(Font.Roboto.medium(size: 16))
                Spacer()
                Text("$10.00")
                    .font(Font.Roboto.medium(size: 16))
            }
            
            HStack {
                Text("Per Person")
                    .font(Font.Roboto.medium(size: 24))
                Spacer()
                Text(textField)
                    .font(Font.Roboto.medium(size: 24))
            }
            
        }
    }
    
    private var checkbox: some View {
        HStack {
            Button(action: {}) {
                Image.checkSelected
            }
            .frame(width: 31, height: 31)
            .background(.clear)
            .cornerRadius(7)
            .overlay(
                RoundedRectangle(cornerRadius: 7)
                    .stroke(Color.checkboxOrange, lineWidth: 1)
            )
            Text("Take a photo of receipt")
                .font(Font.Roboto.medium(size: 16))
                .padding(.leading, 5)
            
            Spacer()
        }
    }
    
    private var saveButton: some View {
        VStack {
            Button(action: {}) {
                Text("Save payment")
                    .font(Font.Roboto.bold(size: 16))
                    .frame(maxWidth: .infinity)
                    .padding(.vertical, 16)
                    .foregroundColor(.white)
                    .background(Color.gradientOrange)
                    .cornerRadius(12)
                    .overlay(
                        RoundedRectangle(cornerRadius: 12)
                            .stroke(LinearGradient(gradient: Gradient(colors: [.white.opacity(0.1936), .black.opacity(0.198)]), startPoint: .top, endPoint: .bottom), lineWidth: 1)
                    )
            }
        }
    }
}

struct AmountFieldView_Previews: PreviewProvider {
    static var previews: some View {
        FormSectionView(type: .tip)
    }
}
