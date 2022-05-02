//
//  CoreDataStoreManagerTests.swift
//  TipJarTests
//
//  Created by Azhar Islam on 02/05/2022.
//

import XCTest
import CoreData
@testable import TipJar

class CoreDataStoreManagerTests: XCTestCase {
    
    private var storage: CoreDataStoreManager!
    private var viewModel: TipSectionViewModel!
    
    override func setUp() {
        storage = CoreDataStoreManager(.inMemory)
        viewModel = TipSectionViewModel(storage: storage)
    }
    
    func test_savePayment_success() {
        viewModel.addPayment(totalAmount: "$12.00", totalTip: "$1.20", image: "")
        XCTAssertNotNil(viewModel.savedPayments)
    }
    
    func test_savePayment_failure() {
        guard let amount: String? = nil, let tip: String? = nil, let image: String? = nil else { return }
        viewModel.addPayment(totalAmount: amount!, totalTip: tip!, image: image!)
        XCTAssertNil(viewModel.savedPayments)
    }
    
    func test_savePaymentWithoutImage_success() {
        viewModel.addPayment(totalAmount: "$100.00", totalTip: "$10.00")
        XCTAssertNotNil(viewModel.savedPayments)
    }
    
    func test_emptyData_success() {
        viewModel.savedPayments = []
        viewModel.getPayments()
        XCTAssertTrue(viewModel.savedPayments.isEmpty)
    }
    
    func test_emptyData_failure() {
        viewModel.savedPayments = []
        viewModel.addPayment(totalAmount: "$200.00", totalTip: "$20.00", image: "")
        viewModel.getPayments()
        XCTAssertFalse(viewModel.savedPayments.isEmpty)
        XCTAssertFalse(viewModel.amountInDollar.isEmpty)
        XCTAssertFalse(viewModel.totalTipInDollar.isEmpty)
    }
    
    func test_saveDate_success() {
        let payment = SavedPayment(context: storage.context)
        payment.totalTip = "$10.00"
        payment.savedAmount = "$100.00"
        payment.savedDate = Date()
        XCTAssertEqual(payment.date, Date().customDate)
    }
    
    func test_saveDate_failure() {
        let payment = SavedPayment(context: storage.context)
        payment.totalTip = "$10.00"
        payment.savedAmount = "$100.00"
        payment.savedDate = Date()
        XCTAssertNotEqual(payment.date, "1984 January 21")
    }
    
    func test_saveID_success() {
        let payment = SavedPayment(context: storage.context)
        let id = UUID()
        payment.id = id
        XCTAssertEqual(payment.id, id)
    }
    
    func test_saveID_failure() {
        let payment = SavedPayment(context: storage.context)
        payment.id = UUID()
        XCTAssertNotEqual(payment.id, UUID(uuidString: "Hello there"))
    }
    
    func test_dataCount_success() {
        viewModel.addPayment(totalAmount: "$12.00", totalTip: "$1.20", image: "")
        viewModel.addPayment(totalAmount: "$14.00", totalTip: "$1.40", image: "")
        viewModel.addPayment(totalAmount: "$16.00", totalTip: "$1.60", image: "")
        viewModel.addPayment(totalAmount: "$18.00", totalTip: "$1.80", image: "")
        viewModel.getPayments()
        XCTAssertEqual(viewModel.savedPayments.count, 4)
    }
    
    func test_dataCount_failure() {
        viewModel.addPayment(totalAmount: "$12.00", totalTip: "$1.20", image: "")
        viewModel.addPayment(totalAmount: "$14.00", totalTip: "$1.40", image: "")
        viewModel.addPayment(totalAmount: "$16.00", totalTip: "$1.60", image: "")
        viewModel.addPayment(totalAmount: "$18.00", totalTip: "$1.80", image: "")
        viewModel.getPayments()
        XCTAssertNotEqual(viewModel.savedPayments.count, 0)
        XCTAssertNotNil(viewModel.savedPayments)
    }
}
