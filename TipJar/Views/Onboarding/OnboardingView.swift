//
//  OnboardingView.swift
//  TipJar
//
//  Created by Azhar Islam on 30/04/2022.
//

import SwiftUI

/// Manage onboarding here

struct OnboardingView: View {
    
    @AppStorage(Constants.App.currentPage) var currentPage = 1
    
    var body: some View {
        
        if currentPage > totalPages {
            TipSectionView()
        } else {
            WalkthroughView()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        OnboardingView()
    }
}
