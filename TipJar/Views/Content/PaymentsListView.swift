//
//  PaymentsListView.swift
//  TipJar
//
//  Created by Azhar Islam on 27/04/2022.
//

import SwiftUI

struct PaymentsListView: View {
    
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    
    var body: some View {
        ZStack {
            VStack(alignment: .leading) {
                PaymentsHeaderView { action in
                    switch action {
                    case .back:
                        presentationMode.wrappedValue.dismiss()
                    }
                }
                
                ScrollView {
                    
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
