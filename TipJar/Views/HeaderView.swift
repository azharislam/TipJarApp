//
//  HeaderView.swift
//  TipJar
//
//  Created by Azhar Islam on 26/04/2022.
//

import SwiftUI

struct HeaderView: View {
    var body: some View {
        HStack {
            Spacer()
            Image("tipJarLogo")
                .resizable()
                .frame(width: 95, height: 30)
                .padding(.leading, 50)
            Spacer()
            Image("history")
                .resizable()
                .frame(width: 25, height: 25)
                .padding(.trailing, 15)
        }
    }
}

struct HeaderView_Previews: PreviewProvider {
    static var previews: some View {
        HeaderView().previewLayout(.sizeThatFits)
    }
}
