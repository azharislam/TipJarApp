//
//  PaymentsListView.swift
//  TipJar
//
//  Created by Azhar Islam on 27/04/2022.
//

import SwiftUI

struct PaymentsListView: View {
    
    // MARK: - Variables
    
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    @ObservedObject private var viewModel = TipSectionViewModel()
    
    // MARK: - Content View
    
    var body: some View {
        ZStack {
            VStack(alignment: .leading) {
                PaymentsListHeaderView { action in
                    switch action {
                    case .back:
                        presentationMode.wrappedValue.dismiss()
                    }
                }
                if viewModel.savedPayments.isEmpty {
                    ScrollView {
                        VStack(alignment: .center) {
                            Text(Constants.PaymentList.emptyTitle)
                                .font(Font.Roboto.bold(size: 24))
                                .multilineTextAlignment(.center)
                                .padding(.top, 250)
                            Text(Constants.PaymentList.emptyDescription)
                                .font(Font.Roboto.medium(size: 16))
                                .multilineTextAlignment(.center)
                                .padding()
                        }
                    }
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                } else {
                    ScrollView {
                        LazyVGrid(columns: [GridItem(.flexible())], spacing: 8) {
                            VStack {
                                ForEach(viewModel.savedPayments) { savedPayment in
                                    Button {
                                        print("Button is tapped")
                                    } label: {
                                        SavedPaymentView(enteredAmount: savedPayment.totalAmount, totalTip: savedPayment.tipTotal, savedImage: savedPayment.image, date: savedPayment.date)

                                    }
                                }
                            }
                        }
                    }
                }
            }
        }
        .frame(maxWidth: .infinity,
               maxHeight: .infinity)
        .navigationBarHidden(true)
    }
}

// MARK: - Preview

struct PaymentsListView_Previews: PreviewProvider {
    static var previews: some View {
        PaymentsListView()
    }
}
