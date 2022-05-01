//
//  OnboardingView.swift
//  TipJar
//
//  Created by Azhar Islam on 30/04/2022.
//

import Foundation
import SwiftUI

/// Onboarding class that walks through all three screens

struct WalkthroughView: View {
    
    @AppStorage(Constants.App.currentPage) var currentPage = 1
    
    var body: some View {
        
        ZStack {
            if currentPage == 1 {
                SlideView(image: Constants.Onboarding.firstSlideImage, title: Constants.Onboarding.firstSlideTitle, detail: Constants.Onboarding.firstSlideDetail, bgColor: Color.white)
                    .transition(.scale)
            }
            
            if currentPage == 2 {
                SlideView(image: Constants.Onboarding.secondSlideImage, title: Constants.Onboarding.secondSlideTitle, detail: Constants.Onboarding.secondSlideDetail, bgColor: Color.white)
                    .transition(.scale)
            }
            
            if currentPage == 3 {
                SlideView(image: Constants.Onboarding.thirdSlideImage, title: Constants.Onboarding.thirdSlideTitle, detail: Constants.Onboarding.thirdSlideDetail, bgColor: Color.white)
                    .transition(.scale)
            }
        }
        
        .overlay(
            
            Button(action: {
                
                withAnimation(.easeInOut) {
                    
                    if currentPage <= totalPages {
                        currentPage += 1
                    }
                    else {
                        currentPage = 1
                    }
                }
            }
                   , label: {
                       Image(systemName: Constants.Symbols.chevronRight)
                           .font(.system(size: 20, weight: .semibold))
                           .foregroundColor(.white)
                           .frame(width: 40, height: 60)
                           .background(Color.gradientOrange)
                           .clipShape(Circle())
                           .overlay(
                            ZStack {
                                
                                Circle()
                                    .stroke(Color.black.opacity(0.04), lineWidth: 4)
                                
                                Circle()
                                    .trim(from: 0, to: CGFloat(currentPage) / CGFloat(totalPages))
                                    .stroke(Color.checkboxGray, lineWidth: 4)
                                    .rotationEffect(.init(degrees: -90))
                            }
                                .padding(-15)
                           )
                   })
            .padding(.bottom, 30)
            ,alignment: .bottom
        )
    }
}
