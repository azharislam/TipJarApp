//
//  HeaderView.swift
//  TipJar
//
//  Created by Azhar Islam on 26/04/2022.
//

import SwiftUI

struct TipSectionHeaderView: View {
    
    /// Enum for future use to add new buttons, like currency picker.
    enum HomeHeaderActions {
        case savedPayments
    }
    
    typealias HomeHeaderActionsHandler = (_ action: HomeHeaderActions) -> Void
    
    let handler: HomeHeaderActionsHandler
    
    init(handler: @escaping TipSectionHeaderView.HomeHeaderActionsHandler) {
        self.handler = handler
    }
    
    var body: some View {
        HStack {
            Spacer()
            Image.logo
                .resizable()
                .frame(width: 114, height: 30)
                .padding(.leading, 60)
            Spacer()
            Button(action: {
                handler(.savedPayments)
            }) {
                Image.history
                    .resizable()
                    .frame(width: 25, height: 25)
                    .padding(.trailing, 25)
            }
        }
    }
}

struct HeaderView_Previews: PreviewProvider {
    static var previews: some View {
        TipSectionHeaderView(handler: { _ in })
    }
}
