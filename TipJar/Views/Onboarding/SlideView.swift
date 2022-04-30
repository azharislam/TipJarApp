//
//  SlideView.swift
//  TipJar
//
//  Created by Azhar Islam on 30/04/2022.
//

import Foundation
import SwiftUI

/// One slide of onboarding, repeated three times with different data

struct SlideView: View {
    
    var image: String
    var title: String
    var detail: String
    var bgColor: Color
    @AppStorage("currentPage") var currentPage = 1
    
    
    var body: some View {
        VStack(spacing: 20) {
            
            HStack {
                
                if currentPage == 1 {
                    
                    Image.logo
                }
                else {
                    Button(action: {
                        
                        withAnimation(.easeInOut) {
                            currentPage -= 1
                        }
                    }, label: {
                        
                        Image(systemName: "chevron.left")
                            .foregroundColor(.white)
                            .padding(.vertical, 10)
                            .padding(.horizontal)
                            .background(Color.checkboxOrange)
                            .cornerRadius(10)
                    })
                }
                
                Spacer()
                
                Button(action: {
                    withAnimation(.easeInOut) {
                        currentPage = 4
                    }
                }, label: {
                    Text("Skip")
                        .fontWeight(.semibold)
                        .kerning(1.2)
                })
            }
            .foregroundColor(.black)
            .padding(.top, 60)
            
            Image(image)
                .resizable()
                .padding(.top, 60)
                .aspectRatio(contentMode: .fit)
            Text(title)
                .font(Font.Roboto.bold(size: 40))
                .fontWeight(.bold)
                .foregroundColor(Color.gradientOrange)
                .foregroundColor(.black)
                .multilineTextAlignment(.center)
            Text(detail)
                .font(Font.Roboto.regular(size: 20))
                .fontWeight(.bold)
                .foregroundColor(Color.black)
                .kerning(1.3)
                .multilineTextAlignment(.center)
            
            Spacer(minLength: 120)
        }
        .padding(.horizontal, 20)
        .background(bgColor).cornerRadius(15).ignoresSafeArea()
    }
}

var totalPages = 3

struct SlideView_Previews: PreviewProvider {
    static var previews: some View {
        SlideView(image: "spending", title: "Keep track!", detail: "TipJar will help you keep track of your payments and help you manage your finances better. Save your first tip now!", bgColor: Color.white)
    }
}
