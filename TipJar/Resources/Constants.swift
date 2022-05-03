//
//  Strings.swift
//  TipJar
//
//  Created by Azhar Islam on 01/05/2022.
//

import Foundation

/// Custom string constants, separated by logic and view

struct Constants {
    
    struct App {
        static let currentPage = "currentPage"
        static let emptyString = ""
        static let done = "Done"
        static let placeholder = "placeholder"
    }
    
    struct AlertMessage {
        static let errorTitle = "Oops"
        static let errorDesc = "Error saving your payment. Make sure all fields are filled."
    }
    
    struct Payment {
        static let savedDate = "savedDate"
        static let amount = "amount"
        static let totalTipAmount = "totalTipAmount"
        static let imageDirectory = "imageDirectory"
    }
    
    struct DataModel {
        static let container = "TipJarContainer"
        static let entity = "SavedPayment"
        static let nullDirectory = "/dev/null"
    }
    
    struct Symbols {
        static let chevronLeft = "chevron.left"
        static let chevronRight = "chevron.right"
        static let dollar = "$"
        static let percentage = "%"
        static let dateFormat = "yyyy MMMM dd"
    }
    
    struct Onboarding {
        static let skip = "Skip"
        static let firstSlideImage = "tipJar"
        static let secondSlideImage = "camera"
        static let thirdSlideImage = "spending"
        static let firstSlideTitle = "Welcome!"
        static let secondSlideTitle = "Snap a receipt!"
        static let thirdSlideTitle = "Keep track!"
        static let firstSlideDetail = "Are you a generous soul that loves to tip after a nice meal out? \n Why not start saving your tips in one place?"
        static let secondSlideDetail = "Don't like stashing old receipt papers? Take a photo using our camera and keep it saved forever!"
        static let thirdSlideDetail = "TipJar will help you keep track of your payments and help you manage your finances better. Save your first tip now!"
    }
    
    struct TipSection {
        static let amountTextView = "Enter amount"
        static let amountPlaceholder = "100.00"
        static let peopleTextView = "How many people?"
        static let tipTextView = "% TIP"
        static let tipTextfield = "10"
        static let peopleSummary = "Per Person"
        static let tipSummary = "Total tip"
        static let checkboxTextView = "Take a photo of receipt"
        static let saveButtonText = "Save payment"
    }
    
    struct PaymentList {
        static let navTitle = "Saved payments"
        static let emptyTitle = "No Saved Payments"
        static let emptyDescription = "It seems you haven't saved any payments! \n When you do they will show up here."
    }
    
    struct PaymentDetail {
        static let tip = "Tip: "
    }
}
