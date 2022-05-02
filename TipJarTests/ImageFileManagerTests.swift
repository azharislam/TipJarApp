//
//  ImageFileManagerTests.swift
//  TipJarTests
//
//  Created by Azhar Islam on 02/05/2022.
//

import XCTest
@testable import TipJar

class ImageFileManagerTests: XCTestCase {
    
    private var manager = ImageFileManager()
    private let viewModel = TipSectionViewModel()

    func test_fetchImage_success() {
        viewModel.image = UIImage(named: "receipt")
        XCTAssertNotNil(ImageFileManager.fetchImage(ImageFileManager.imageName))
    }
    
    func test_fetchImage_failure() {
        viewModel.image = UIImage(named: "")
        XCTAssertNil(ImageFileManager.fetchImage(ImageFileManager.imageName))
    }
    
    func test_saveImage_success() {
        let imageTitle = "Testing Image"
        guard let image = UIImage(named: "receipt") else { return }
        XCTAssertNotNil(ImageFileManager.saveImage(imageTitle, image: image))
    }
    
    func test_saveImage_failure() {
        let imageTitle = "Testing Image"
        guard let image = UIImage(named: "no image") else { return }
        XCTAssertNil(ImageFileManager.saveImage(imageTitle, image: image))
    }
}
