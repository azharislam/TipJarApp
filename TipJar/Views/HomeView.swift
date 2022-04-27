//
//  HomeView.swift
//  TipJar
//
//  Created by Azhar Islam on 27/04/2022.
//

import SwiftUI

struct HomeView: View {
    
    @State private var showPayments: Bool?
    
    var body: some View {
        
        NavigationView {
            
            ZStack(alignment: .bottom) {
                NavigationLink(destination: PaymentsListView(),
                               tag: true,
                               selection: $showPayments) {
                    EmptyView()
                }
                
                VStack(spacing: 15) {
                    HomeHeaderView { action in
                        switch action {
                        case .savedPayments:
                            showPayments = true
                        }
                    }
                    
                    VStack(spacing: 32) {
                        FormSectionView(type: .amount)
                        FormSectionView(type: .peopleCount)
                        FormSectionView(type: .tip)
                        FormSectionView(type: .totalTip)
                        FormSectionView(type: .perPerson)
                        FormSectionView(type: .checkbox)
                        FormSectionView(type: .saveButton)
                    }
                    .padding(.leading, 30)
                    .padding(.trailing, 30)
                }
                .padding(.top, -50)
            }
            .frame(maxWidth: .infinity,
                   maxHeight: .infinity)
            .navigationBarHidden(true)
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
