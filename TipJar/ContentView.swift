//
//  ContentView.swift
//  TipJar
//
//  Created by Jumpei Katayama on 2022/02/11.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            HeaderView()
            
            VStack {
                AmountFieldView(type: .amount, placeHolder: "100.00")
                AmountFieldView(type: .tip, placeHolder: "10")
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
