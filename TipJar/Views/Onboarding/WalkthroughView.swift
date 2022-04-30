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
    
    @AppStorage("currentPage") var currentPage = 1
    
    var body: some View {
        
        ZStack {
            if currentPage == 1 {
                SlideView(image: "tipJar", title: "Welcome!", detail: "Are you a generous soul that loves to tip after a nice meal out? \n Why not start saving your tips in one place?", bgColor: Color.white)
                    .transition(.scale)
            }
            
            if currentPage == 2 {
                SlideView(image: "camera", title: "Snap a receipt!", detail: "Don't like stashing old receipt papers? Take a photo using our camera and keep it saved forever!", bgColor: Color.white)
                    .transition(.scale)
            }
            
            if currentPage == 3 {
                SlideView(image: "spending", title: "Keep track!", detail: "TipJar will help you keep track of your payments and help you manage your finances better. Save your first tip now!", bgColor: Color.white)
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
                       Image(systemName: "chevron.right")
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
