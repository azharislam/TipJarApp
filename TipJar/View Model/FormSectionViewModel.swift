//
//  FormSectionViewModel.swift
//  TipJar
//
//  Created by Azhar Islam on 27/04/2022.
//

import Foundation
import SwiftUI
import Combine


final class FormSectionViewModel: ObservableObject {
    
    private var cancellables = Set<AnyCancellable>()
    @Published var enterAmount = ""
    @Published var peopleCount: Int = 1
    @Published var enterTip = ""
    @State var totalTip = ""
    @Published var perPersonAmount = ""
    
    init() {
        $enterAmount
            .sink { amountEntered in
                print("User entered \(amountEntered)")
                self.totalTip = amountEntered
                print("Total tip is \(self.totalTip)")
            }
            .store(in: &cancellables)
    }
    
    
}
