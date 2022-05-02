//
//  TipSectionViewModelTests.swift
//  TipJarTests
//
//  Created by Azhar Islam on 01/05/2022.
//

import XCTest
@testable import TipJar

class TipSectionViewModelTests: XCTestCase {

    private var viewModel: TipSectionViewModel!
    private var storage: CoreDataStoreManager!
    
    override func setUp() {
        storage = CoreDataStoreManager(.inMemory)
        viewModel = TipSectionViewModel(storage: storage)
    }
    
    // MARK: - Test Variables
    
    func test_tipPercentage_isTenPercent_success() {
        XCTAssertEqual(viewModel.tipPercentage, 0.1)
    }
    
    func test_tipPercentage_isTenPercent_failure() {
        XCTAssertNotEqual(viewModel.tipPercentage, 10)
    }

    func test_moreThanOne_success() {
        viewModel.peopleCount = 2
        XCTAssertTrue(viewModel.moreThanOnePerson)
    }
    
    func test_moreThanOne_failure() {
        viewModel.peopleCount = 0
        XCTAssertFalse(viewModel.moreThanOnePerson)
    }
    
    func test_peopleCountIsDouble_success() {
        viewModel.peopleCount = 1
        XCTAssertEqual(viewModel.peopleCountDouble, 1.0)
    }
    
    func test_peopleCountIsDouble_failure() {
        viewModel.peopleCount = 1
        XCTAssertNotEqual(viewModel.peopleCountDouble, 2.0)
    }
    
    func test_doubleToCurrency_success() {
        viewModel.amount = 2.50
        viewModel.totalTip = 2.50
        viewModel.perPersonAmount = 2.50
        XCTAssertEqual(viewModel.amountInDollar, "$2.50")
        XCTAssertEqual(viewModel.totalTipInDollar, "$2.50")
        XCTAssertEqual(viewModel.perPersonInDollar, "$2.50")
    }
    
    func test_doubleToCurrency_failure() {
        viewModel.amount = 2.50
        viewModel.totalTip = 2.50
        viewModel.perPersonAmount = 2.50
        XCTAssertNotEqual(viewModel.amountInDollar, "2.50")
        XCTAssertNotEqual(viewModel.totalTipInDollar, "2.50")
        XCTAssertNotEqual(viewModel.perPersonInDollar, "2.50")
    }
    
    func test_isRoundedCurrency_success() {
        viewModel.amount = 300.496
        viewModel.totalTip = 30.443
        viewModel.perPersonAmount = 10.45
        XCTAssertEqual(viewModel.amountInDollar, "$300.50")
        XCTAssertEqual(viewModel.totalTipInDollar, "$30.44")
        XCTAssertEqual(viewModel.perPersonInDollar, "$10.45")
    }
    
    func test_isAssignedCurrency_failure() {
        viewModel.amount = 300.496
        viewModel.totalTip = 30.443
        viewModel.perPersonAmount = 10.45
        XCTAssertNotEqual(viewModel.amountInDollar, "$300.49")
        XCTAssertNotEqual(viewModel.totalTipInDollar, "$30.45")
        XCTAssertNotEqual(viewModel.perPersonInDollar, "$10.46")
    }
    
    // MARK: - Test Calculation Function
    
    func test_calculateAmount_success() {
        viewModel.enteredAmount = "200"
        viewModel.calculateTip()
        XCTAssertEqual(viewModel.amount, 200.0)
        XCTAssertEqual(viewModel.totalTip, 20.0)
        XCTAssertEqual(viewModel.perPersonAmount, 20.0)
        XCTAssertNotNil(viewModel.amountInDollar)
    }
    
    func test_calculateAmount_failure() {
        viewModel.enteredAmount = "100"
        viewModel.calculateTip()
        XCTAssertNotEqual(viewModel.amount, 200.0)
        XCTAssertNotEqual(viewModel.totalTip, 20.0)
        XCTAssertNotEqual(viewModel.perPersonAmount, 20.0)
    }
    
    func test_calculatePeopleCountAmountChanged_success() {
        viewModel.enteredAmount = "200"
        viewModel.peopleCount = 2
        viewModel.calculateTip()
        XCTAssertEqual(viewModel.amount, 200.0)
        XCTAssertEqual(viewModel.perPersonAmount, 10.0)
        XCTAssertEqual(viewModel.totalTip, 20.0)
    }
    
    func test_calculatePeopleCountAmountChanged_failure() {
        viewModel.enteredAmount = "200"
        viewModel.peopleCount = 2
        viewModel.calculateTip()
        XCTAssertNotEqual(viewModel.amount, 300.0)
        XCTAssertNotEqual(viewModel.perPersonAmount, 20.0)
        XCTAssertNotEqual(viewModel.totalTip, 10.0)
    }
    
    func test_calculateAmountCurrency_success() {
        viewModel.enteredAmount = "200"
        viewModel.calculateTip()
        XCTAssertEqual(viewModel.amountInDollar, "$200.00")
        XCTAssertEqual(viewModel.totalTipInDollar, "$20.00")
        XCTAssertEqual(viewModel.perPersonInDollar, "$20.00")
    }
    
    func test_calculateAmountCurrency_failure() {
        viewModel.enteredAmount = "200"
        viewModel.calculateTip()
        XCTAssertNotEqual(viewModel.amountInDollar, "£200.00")
        XCTAssertNotEqual(viewModel.totalTipInDollar, "€20.00")
        XCTAssertNotEqual(viewModel.perPersonInDollar, "£20.00")
    }
    
    func test_calculatePeopleCountChangedCurrency_success() {
        viewModel.enteredAmount = "200"
        viewModel.peopleCount = 2
        viewModel.calculateTip()
        XCTAssertEqual(viewModel.amountInDollar, "$200.00")
        XCTAssertEqual(viewModel.totalTipInDollar, "$20.00")
        XCTAssertEqual(viewModel.perPersonInDollar, "$10.00")
    }
    
    func test_calculatePeopleCountChangedCurrency_failure() {
        viewModel.enteredAmount = "200"
        viewModel.peopleCount = 2
        viewModel.calculateTip()
        XCTAssertNotEqual(viewModel.amountInDollar, "£200.00")
        XCTAssertNotEqual(viewModel.totalTipInDollar, "£20.00")
        XCTAssertNotEqual(viewModel.perPersonInDollar, "£10.00")
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
        XCTAssertNotEqual(viewModel.amount, 100)
        XCTAssertTrue(viewModel.amount.isZero)
        XCTAssertNotEqual(viewModel.totalTip, 10)
        XCTAssertTrue(viewModel.totalTip.isZero)
        XCTAssertNotEqual(viewModel.perPersonAmount, 10)
        XCTAssertTrue(viewModel.perPersonAmount.isZero)
    }
}
