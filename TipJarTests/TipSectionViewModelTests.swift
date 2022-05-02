//
//  TipSectionViewModelTests.swift
//  TipJarTests
//
//  Created by Azhar Islam on 01/05/2022.
//

import XCTest
@testable import TipJar

class TipSectionViewModelTests: XCTestCase {

    private let viewModel = TipSectionViewModel()
    private let database = CoreDataStoreManager.instance
    
    // MARK: - Test Variables
    
    func test_tipPercentage_isTenPercent() {
        XCTAssertEqual(viewModel.tipPercentage, 0.1)
    }

    func test_moreThanOne_success() {
        viewModel.peopleCount = 2
        XCTAssertTrue(viewModel.moreThanOnePerson)
    }
    
    func test_moreThanOne_fail() {
        viewModel.peopleCount = 0
        XCTAssertFalse(viewModel.moreThanOnePerson)
    }
    
    func test_peopleCountIsDouble_success() {
        viewModel.peopleCount = 1
        XCTAssertEqual(viewModel.peopleCountDouble, 1.0)
    }
    
    func test_amountIsCurrency_success() {
        viewModel.amount = 2.50
        XCTAssertEqual(viewModel.amountString, "$2.50")
    }
    
    func test_totalTipIsCurrency_success() {
        viewModel.totalTip = 2.50
        XCTAssertEqual(viewModel.totalTipString, "$2.50")
    }
    
    func test_perPersonIsCurrency_success() {
        viewModel.perPersonAmount = 2.50
        XCTAssertEqual(viewModel.perPersonAmountString, "$2.50")
    }
    
    // MARK: - Test Calculation Function
    
    func test_calculateAmount_success() {
        viewModel.enteredAmount = "100"
        viewModel.calculateTip()
        XCTAssertEqual(viewModel.amount, 100.0)
    }
    
    func test_calculateTipAmount_success() {
        viewModel.enteredAmount = "100"
        viewModel.calculateTip()
        XCTAssertEqual(viewModel.totalTip, 10.0)
    }
    
    func test_calculatePerPersonAmount_success() {
        viewModel.enteredAmount = "200"
        viewModel.calculateTip()
        XCTAssertEqual(viewModel.perPersonAmount, 20.0)
    }
    
    func test_calculatePeopleCountAmountChanged_success() {
        viewModel.enteredAmount = "200"
        viewModel.peopleCount = 2
        viewModel.calculateTip()
        XCTAssertEqual(viewModel.perPersonAmount, 10.0)
    }
    
    func test_calculateAmountCurrency_success() {
        viewModel.enteredAmount = "200"
        viewModel.calculateTip()
        XCTAssertEqual(viewModel.amountString, "$200.00")
    }
    
    func test_calculateTipAmountCurrency_success() {
        viewModel.enteredAmount = "200"
        viewModel.calculateTip()
        XCTAssertEqual(viewModel.totalTipString, "$20.00")
    }
    
    func test_calculatePeopleCountAmountCurrency_success() {
        viewModel.enteredAmount = "200"
        viewModel.calculateTip()
        XCTAssertEqual(viewModel.perPersonAmountString, "$20.00")
    }
    
    func test_calculatePopleCountAmountChangedCurrency_success() {
        viewModel.enteredAmount = "200"
        viewModel.peopleCount = 2
        viewModel.calculateTip()
        XCTAssertEqual(viewModel.perPersonAmountString, "$10.00")
    }
    
    func test_calculateAmountEmpty_success() {
        viewModel.enteredAmount = ""
        viewModel.calculateTip()
        XCTAssertTrue(viewModel.enteredAmount.isEmpty)
    }
    
    func test_calculateAmountEmpty_fail() {
        viewModel.enteredAmount = "125"
        viewModel.calculateTip()
        XCTAssertFalse(viewModel.enteredAmount.isEmpty)
    }
    
    func test_calculateAmountEmpty_defaultSuccess() {
        viewModel.enteredAmount = ""
        viewModel.calculateTip()
        XCTAssertEqual(viewModel.amount, 100)
        XCTAssertFalse(viewModel.amount.isZero)
        XCTAssertEqual(viewModel.totalTip, 10)
        XCTAssertFalse(viewModel.totalTip.isZero)
        XCTAssertEqual(viewModel.perPersonAmount, 10)
        XCTAssertFalse(viewModel.perPersonAmount.isZero)
    }
    
    func test_calculateAmountEmpty_defaultFail() {
        viewModel.enteredAmount = "0"
        viewModel.calculateTip()
        XCTAssertEqual(viewModel.amount, 0)
        XCTAssertTrue(viewModel.amount.isZero)
        XCTAssertEqual(viewModel.totalTip, 0)
        XCTAssertTrue(viewModel.totalTip.isZero)
        XCTAssertEqual(viewModel.perPersonAmount, 0)
        XCTAssertTrue(viewModel.perPersonAmount.isZero)
    }
}
