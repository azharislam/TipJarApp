//
//  ImageStoreManagerTests.swift
//  TipJarTests
//
//  Created by Azhar Islam on 02/05/2022.
//

import XCTest
@testable import TipJar

class ImageFileManagerTests: XCTestCase {

    private var manager = ImageStoreManager()
    private let viewModel = TipSectionViewModel(storage: CoreDataStoreManager(.inMemory))

    func test_fetchImage_success() {
        viewModel.image = UIImage(named: "receipt")
        XCTAssertNotNil(ImageStoreManager.fetchImage(ImageStoreManager.imageName))
    }

    func test_fetchImage_failure() {
        viewModel.image = UIImage(named: "")
        XCTAssertNil(ImageStoreManager.fetchImage(ImageStoreManager.imageName))
    }

    func test_saveImage_success() {
        let imageTitle = "Testing Image"
        guard let image = UIImage(named: "receipt") else { return }
        XCTAssertNotNil(ImageStoreManager.saveImage(imageTitle, image: image))
    }

    func test_saveImage_failure() {
        let imageTitle = "Testing Image"
        guard let image = UIImage(named: "no image") else { return }
        XCTAssertNil(ImageStoreManager.saveImage(imageTitle, image: image))
    }
}
