//
//  CustomTextfieldView.swift
//  TipJar
//
//  Created by Azhar Islam on 27/04/2022.
//

import SwiftUI

/// Re-usable custom textfield

struct TextfieldComponent<Content: View>: View {
    
    private let content: Content
    
    public init(@ViewBuilder content: () -> Content) {
        self.content = content()
    }
    
    public var body: some View {
        content
            .frame(maxWidth: .infinity)
            .font(Font.Roboto.medium(size: 42))
            .multilineTextAlignment(.center)
            .cornerRadius(12)
            .overlay(RoundedRectangle(cornerRadius: 12)
                .stroke(Color.borderGray, lineWidth: 0.5)
                .shadow(color: Color.black, radius: 10, x: 2, y: 2))
    }
}
