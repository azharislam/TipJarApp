//
//  PaymentsHeaderView.swift
//  TipJar
//
//  Created by Azhar Islam on 27/04/2022.
//

import SwiftUI

struct PaymentsListHeaderView: View {
    
    /// Enum for future use to add new buttons, like filter.
    enum PaymentHeaderActions {
        case back
    }
    
    typealias PaymentsHeaderActionHandler = (_ action: PaymentHeaderActions) -> Void
    let handler: PaymentsHeaderActionHandler
    
    internal init(handler: @escaping PaymentsListHeaderView.PaymentsHeaderActionHandler) {
        self.handler = handler
    }
    
    var body: some View {
        VStack {
            HStack {
                
                Button(action: {
                    handler(.back)
                }, label: {
                    Image.back
                        .resizable()
                        .frame(width: 10, height: 20)
                })
                .padding(.leading, 25)
                Spacer()
                
                Text(Constants.PaymentList.navTitle.uppercased())
                    .font(Font.Roboto.medium(size: 16))
                    .padding(.trailing, 125)
            }
            .padding(.top, 20)
            .frame( maxWidth: .infinity)
            
            RoundedRectangle(cornerRadius: 5)
                .frame(height: 2)
                .foregroundColor(Color.navigationGray)
        }
        
    }
}

struct PaymentsHeaderView_Previews: PreviewProvider {
    static var previews: some View {
        PaymentsListHeaderView(handler: { _ in }).previewLayout(.sizeThatFits)
    }
}
