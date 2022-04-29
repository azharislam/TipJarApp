//
//  PaymentsListView.swift
//  TipJar
//
//  Created by Azhar Islam on 27/04/2022.
//

import SwiftUI

struct PaymentsListView: View {
    
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    @ObservedObject private var viewModel = TipSectionViewModel()
    @FetchRequest(sortDescriptors: [SortDescriptor(\.savedDate, order: .reverse)])
    var payments: FetchedResults<SavedPayments>
    
    var body: some View {
        ZStack {
            VStack(alignment: .leading) {
                PaymentsHeaderView { action in
                    switch action {
                    case .back:
                        presentationMode.wrappedValue.dismiss()
                    }
                }
                if viewModel.savedPayments.isEmpty {
                    ScrollView {
                        VStack(alignment: .center) {
                            Text("No Saved Payments")
                                .font(Font.Roboto.bold(size: 24))
                                .multilineTextAlignment(.center)
                                .padding(.top, 250)
                            Text("It seems you haven't saved any payments! \n When you do they will show up here.")
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
                                    SavedPaymentView(payment: savedPayment)
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

struct PaymentsListView_Previews: PreviewProvider {
    static var previews: some View {
        PaymentsListView()
    }
}
