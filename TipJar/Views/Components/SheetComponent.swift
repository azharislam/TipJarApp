//
//  ModalComponent.swift
//  TipJar
//
//  Created by Azhar Islam on 01/05/2022.
//

import SwiftUI

/// Custom modal view that pops up when user taps a payment from payment list
/// Built generically so it can be modified for future changes

struct SheetComponent<Content: View>: View {
    @Binding var isPresented: Bool
    var content: () -> Content

    var body: some View {
        ZStack {
            if isPresented {
                Color.black
                    .edgesIgnoringSafeArea(.all)
                    .transition(.opacity)
                    .opacity(0.6)
                    .border(.black, width: 1)
                    .onTapGesture {
                        isPresented = false
                    }
                content()
            }
        }
        .ignoresSafeArea()
        .animation(.easeInOut, value: isPresented)
    }
}

struct SheetComponent_Previews: PreviewProvider {
    static var previews: some View {
        SheetComponent(isPresented: .constant(true)) { EmptyView() }
    }
}

extension View {
    func customSheet<Content: View>(isPresented: Binding<Bool>, _ content: @escaping () -> Content) -> some View {
        ZStack {
            self
            SheetComponent(isPresented: isPresented, content: content)
        }
    }
}
