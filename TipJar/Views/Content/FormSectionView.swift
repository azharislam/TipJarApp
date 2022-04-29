//
//  AmountFieldView.swift
//  TipJar
//
//  Created by Azhar Islam on 26/04/2022.
//

import SwiftUI

struct FormSectionView: View {
    
    @StateObject private var viewModel = FormSectionViewModel()
    @State private var showPaymentsView: Bool?

    @State var textField: String = ""
    @State var newReceipt = Receipt(savedAmount: 0.0, savedTip: 0.0, savedImage: "")
    
    var body: some View {
        
        NavigationView {
            ZStack(alignment: .bottom) {
                NavigationLink(destination: PaymentsListView(),
                               tag: true,
                               selection: $showPaymentsView) {
                    EmptyView()
                }
                
                VStack(spacing: 15) {
                    HomeHeaderView { action in
                        switch action {
                        case .savedPayments:
                            showPaymentsView = true
                        }
                    }
                    
                    VStack(spacing: 32) {
                        
                        amountField
                        peopleCount
                        tipField
                        summarySection
                        Spacer()
                        checkbox
                        saveButton
                        
                    }
                    .padding(.leading, 30)
                    .padding(.trailing, 30)
                    .adaptsToKeyboard()
                    
                }
                .padding(.top, 15)
                .padding(.bottom, 20)
            }
            .frame(maxWidth: .infinity,
                   maxHeight: .infinity)
            .navigationBarHidden(true)
        }
    }
    
    
    @ViewBuilder
    private var amountField: some View {
        VStack(alignment: .leading) {
            Text("Enter amount")
                .font(Font.Roboto.medium(size: 16))
            CustomTextfieldView {
                TextField("100.00", text: $viewModel.enteredAmount)
                    .keyboardType(.decimalPad)
                    .frame(height: 80)
                    .overlay(alignment: .leading) {
                        Text("$")
                            .font(Font.Roboto.medium(size: 24))
                            .padding(.leading, 20)
                    }
                    .onChange(of: viewModel.enteredAmount) { newValue in
                        viewModel.calculateTip()
                    }
            }
        }
    }
    
    @ViewBuilder
    private var peopleCount: some View {
        VStack(alignment: .leading) {
            Text("How many people?")
                .font(Font.Roboto.medium(size: 16))
            HStack {
                Button(action: {
                    viewModel.peopleCount += 1
                    viewModel.calculateTip()
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
                    if viewModel.moreThanOnePerson {
                        viewModel.peopleCount -= 1
                        viewModel.calculateTip()
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
    
    @ViewBuilder
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
    
    @ViewBuilder
    private var summarySection: some View {
        VStack(spacing: 16) {
            HStack {
                Text("Total Tip")
                    .font(Font.Roboto.medium(size: 16))
                Spacer()
                Text(viewModel.totalTip, format: .currency(code: Locale.current.currencyCode ?? "USD"))
                    .font(Font.Roboto.medium(size: 16))
            }
            
            HStack {
                Text("Per Person")
                    .font(Font.Roboto.medium(size: 24))
                Spacer()
                Text(viewModel.perPersonAmount, format: .currency(code: Locale.current.currencyCode ?? "USD"))
                    .font(Font.Roboto.medium(size: 24))
            }
            
        }
    }
    
    @ViewBuilder
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
    
    @ViewBuilder
    private var saveButton: some View {
        VStack {
            Button(action: {
                print("\(viewModel.isSaved.description)")
                newReceipt.totalAmount = viewModel.amount
                newReceipt.tipAmount = viewModel.totalTip
                viewModel.addSavedPayment(receipt: newReceipt)
            }) {
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
        FormSectionView()
    }
}
