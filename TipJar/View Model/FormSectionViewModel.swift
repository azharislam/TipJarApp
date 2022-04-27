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
    @Published var enteredAmount = ""
    @Published var peopleCount: Int = 1
    @Published var enterTip = ""
    @Published var totalTip = ""
    @Published var perPersonAmount = ""
    
    
    var peopleCountDecreased: Bool {
        peopleCount > 1
    }

}
