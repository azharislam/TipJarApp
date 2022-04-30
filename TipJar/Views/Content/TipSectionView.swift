//
//  AmountFieldView.swift
//  TipJar
//
//  Created by Azhar Islam on 26/04/2022.
//

import SwiftUI

struct TipSectionView: View, KeyboardReadable {
    
    // MARK: - Variables
    
    @StateObject private var viewModel = TipSectionViewModel()
    
    @State private var textField: String = ""
    @State private var currency = "USD"
    @State private var isCameraEnabled: Bool = false
    @State private var isCheckSelected: Bool = false
    
    // MARK: - Main Content View
    
    var body: some View {
        
        NavigationView {
            ZStack(alignment: .bottom) {
                NavigationLink(destination: PaymentsListView(),
                               tag: true,
                               selection: $viewModel.showPaymentsView) {
                    EmptyView()
                }
                
                VStack(spacing: 15) {
                    TipSectionHeaderView { action in
                        switch action {
                        case .savedPayments:
                            viewModel.showPaymentsView = true
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
                    keyboardView
                }
                .padding(.top, 15)
                .padding(.bottom, 20)
                .onReceive(keyboardPublisher) { value in
                    viewModel.isKeyboardEnabled = value
                }
            }
            .frame(maxWidth: .infinity,
                   maxHeight: .infinity)
            .navigationBarHidden(true)
            .sheet(isPresented: $isCameraEnabled) { cameraView }
        }
    }
    
    // MARK: - User Input Textfield
    
    @ViewBuilder
    private var amountField: some View {
        VStack(alignment: .leading) {
            Text("Enter amount")
                .font(Font.Roboto.medium(size: 16))
            TextfieldComponent {
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
    
    // MARK: - People Counter
    
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
    
    // MARK: - Tip Percentage
    
    @ViewBuilder
    private var tipField: some View {
        VStack(alignment: .leading) {
            Text("% TIP")
                .font(Font.Roboto.medium(size: 16))
            TextfieldComponent {
                TextField("", text: $textField)
                    .disabled(true)
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
    
    // MARK: - Amount Summary
    
    @ViewBuilder
    private var summarySection: some View {
        VStack(spacing: 16) {
            HStack {
                Text("Total Tip")
                    .font(Font.Roboto.medium(size: 16))
                Spacer()
                Text(viewModel.totalTip, format: .currency(code: Locale.current.currencyCode ?? currency))
                    .font(Font.Roboto.medium(size: 16))
            }
            
            HStack {
                Text("Per Person")
                    .font(Font.Roboto.medium(size: 24))
                Spacer()
                Text(viewModel.perPersonAmount, format: .currency(code: Locale.current.currencyCode ?? currency))
                    .font(Font.Roboto.medium(size: 24))
            }
            
        }
    }
    
    // MARK: - Take Photo Checkbox
    
    @ViewBuilder
    private var checkbox: some View {
        HStack {
            Button(action: {
                isCheckSelected.toggle()
            }) {
                isCheckSelected ? Image.checkSelected : Image.checkUnselected
            }
            .buttonStyle(CheckboxComponent(isSelected: isCheckSelected))
            .background(.clear)
            
            Text("Take a photo of receipt")
                .font(Font.Roboto.medium(size: 16))
                .padding(.leading, 5)
            
            Spacer()
        }
    }
    
    // MARK: - Save Payment Button
    
    @ViewBuilder
    private var saveButton: some View {
        VStack {
            Button(action: {
                if isCheckSelected {
                    isCameraEnabled = true
                } else {
                    guard !viewModel.enteredAmount.isEmpty else { return }
                    viewModel.addPayment(totalAmount: viewModel.amount, totalTip: viewModel.totalTip, image: "")
                    viewModel.showPaymentsView = true
                    viewModel.enteredAmount = ""
                    // Add some nice graphic to show successful save
                }
            }) {
                Text("Save payment")
                    .font(Font.Roboto.bold(size: 16))
                    .frame(maxWidth: .infinity)
                    .padding(.vertical, 16)
                    .foregroundColor(.white)
                    .background(Color.gradientOrange)
                    .cornerRadius(12)
                    .overlay(
                        // Make this a custom re-usable component
                        RoundedRectangle(cornerRadius: 12)
                            .stroke(LinearGradient(gradient: Gradient(colors: [.white.opacity(0.1936), .black.opacity(0.198)]), startPoint: .top, endPoint: .bottom), lineWidth: 1)
                    )
            }
        }
    }
    
    // MARK: - Camera View
    
    @ViewBuilder
    private var cameraView: some View {
        CameraComponent(isShowing: $isCameraEnabled, selectedImage: $viewModel.image)
    }
    
    // MARK: - Keyboard View
    
    @ViewBuilder
    private var keyboardView: some View {
        if viewModel.isKeyboardEnabled {
            VStack(spacing: .zero) {
                KeyboardComponent(actionTitle: "Done") {
                    print("Keyboard is visible")
                }
            }
            .animation(.default, value: viewModel.isKeyboardEnabled)
        }
    }
    
}

// MARK: - Preview

struct AmountFieldView_Previews: PreviewProvider {
    static var previews: some View {
        TipSectionView()
    }
}
