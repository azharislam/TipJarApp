//
//  SavedPaymentView.swift
//  TipJar
//
//  Created by Azhar Islam on 28/04/2022.
//

import SwiftUI

struct SavedPaymentView: View {
    
    var enteredAmount: String
    var totalTip: String
    var savedImage: String
    var date: String
    
    var body: some View {
        VStack(alignment: .leading, spacing: -15) {
            Text(date)
                .font(Font.Roboto.medium(size: 16))
                .foregroundColor(.black)
            HStack(alignment: .bottom) {
                Text(enteredAmount)
                    .font(Font.Roboto.medium(size: 24))
                    .foregroundColor(.black)
                Text("Tip: \(totalTip)")
                    .font(Font.Roboto.medium(size: 16))
                    .foregroundColor(Color.tipGray)
                    .padding(.leading, 20)
                    .padding(.bottom, 3)
                Spacer()
                Image(uiImage: (ImageFileManager.fetchImage(savedImage) ?? UIImage(named: Constants.App.placeholder)) ?? UIImage())
                    .resizable()
                    .scaledToFill()
                    .frame(width: 53.0, height: 53.0)
                    .cornerRadius(12)
                    .overlay(RoundedRectangle(cornerRadius: 12)
                        .stroke(Color.gray, lineWidth: 0.2))
                    .padding(.bottom, 5)
            }
        }
        .padding()
        .background(.white)
    }
}

struct SavedPaymentView_Previews: PreviewProvider {
    static var previews: some View {
        SavedPaymentView(enteredAmount: "$405.50", totalTip: "$40.50", savedImage: "receipt", date: "2022 January 21").previewLayout(.sizeThatFits)
    }
}
