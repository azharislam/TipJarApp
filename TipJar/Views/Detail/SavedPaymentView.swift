//
//  SavedPaymentView.swift
//  TipJar
//
//  Created by Azhar Islam on 28/04/2022.
//

import SwiftUI

struct SavedPaymentView: View {
    
    var payment: SavedPayments     // Put this in an abstract model
    
    var body: some View {
        VStack(alignment: .leading) {
            Text(payment.savedDate?.customDate ?? "Unknown Date")
                .font(Font.Roboto.medium(size: 16))
            HStack {
                Text(payment.totalAmount, format: .currency(code: Locale.current.currencyCode ?? "USD"))
                    .font(Font.Roboto.medium(size: 24))
                Text(payment.totalTip, format: .currency(code: Locale.current.currencyCode ?? "USD"))
                    .font(Font.Roboto.medium(size: 16))
                    .foregroundColor(Color.tipGray)
                    .padding(.leading, 20)
                Spacer()
                Image(uiImage: ImageFileManager.fetchImage(payment.savedImage ?? "") ?? UIImage())
                    .resizable()
                    .scaledToFill()
                    .frame(width: 53.0, height: 53.0)
                    .cornerRadius(12)
            }
            .padding(.top, -30)
        }
        .padding()
        .background(.white)
    }
}
//
//struct SavedPaymentView_Previews: PreviewProvider {
//    static var previews: some View {
//        SavedPaymentView(payment: )
//    }
//}
