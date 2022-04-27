//
//  ContentView.swift
//  TipJar
//
//  Created by Jumpei Katayama on 2022/02/11.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack(spacing: 10) {
            HeaderView()
            
            VStack {
                FormSectionView(type: .amount, placeHolder: "100.00")
                FormSectionView(type: .peopleCount)
                FormSectionView(type: .tip, placeHolder: "10")
                FormSectionView(type: .totalTip)
                FormSectionView(type: .perPerson)
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
