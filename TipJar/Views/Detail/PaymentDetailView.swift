//
//  PaymentDetailView.swift
//  TipJar
//
//  Created by Azhar Islam on 01/05/2022.
//

import SwiftUI

struct PaymentDetailView: View {
    
    var savedPayment: SavedPayment
    
    var body: some View {
        
        VStack(spacing: 12) {
            
            if savedPayment.image != Constants.App.emptyString {
                Image(uiImage: (ImageStoreManager.fetchImage(savedPayment.image) ?? UIImage()))
                    .resizable()
                    .scaledToFit()
                    .frame(height: 400)
                    .background(.white)
                    .cornerRadius(12)
                    .overlay(RoundedRectangle(cornerRadius: 12)
                        .stroke(Color.gray, lineWidth: 0.3))
            }
            
            VStack(alignment: .leading, spacing: 12) {
                Text(savedPayment.date )
                    .font(Font.Roboto.medium(size: 16))
                HStack {
                    Text(savedPayment.totalAmount )
                        .font(Font.Roboto.medium(size: 24))
                    
                    Spacer()
                    Text("\(Constants.PaymentDetail.tip)\(savedPayment.tipTotal )")
                        .font(Font.Roboto.medium(size: 16))
                        .foregroundColor(Color.tipGray)
                }
            }
            .padding(16)
            .background(.white)
            .cornerRadius(12)
            .overlay(RoundedRectangle(cornerRadius: 12)
                .stroke(Color.gray, lineWidth: 0.3))
            .padding(.bottom, 5)
        }
        .padding(.horizontal, 40)
    }
}

struct PaymentDetailView_Previews: PreviewProvider {
    static var previews: some View {
        PaymentDetailView(savedPayment: SavedPayment(context: CoreDataStoreManager.instance.context))
    }
}
