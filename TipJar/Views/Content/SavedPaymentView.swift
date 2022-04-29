//
//  SavedPaymentView.swift
//  TipJar
//
//  Created by Azhar Islam on 28/04/2022.
//

import SwiftUI

struct SavedPaymentView: View {
    
    var receipt: Receipt
    
    var body: some View {
        VStack(alignment: .leading) {
            Text(receipt.savedDate.default)
                .font(Font.Roboto.medium(size: 16))
            HStack {
                Text(receipt.totalAmount, format: .currency(code: Locale.current.currencyCode ?? "USD"))
                .font(Font.Roboto.medium(size: 24))
                Text(receipt.tipAmount, format: .currency(code: Locale.current.currencyCode ?? "USD"))
                    .font(Font.Roboto.medium(size: 16))
                    .foregroundColor(Color.tipGray)
                    .padding(.leading, 20)
                Spacer()
                Image.receipt
                    .padding(.bottom, 30)
            }
            .padding(.top, -30)
        }
        .padding()
        .background(.white)
        .frame(width: .infinity, height: .infinity)
    }
}

struct SavedPaymentView_Previews: PreviewProvider {
    static var previews: some View {
        SavedPaymentView(receipt: Receipt(savedAmount: 405.52, savedTip: 40.52, savedImage: ""))
    }
}
