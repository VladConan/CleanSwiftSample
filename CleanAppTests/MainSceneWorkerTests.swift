//
//  MainSceneWorkerTests.swift
//  CleanApp
//
//  Created by Vladimir on 23.12.2019.
//  Copyright (c) 2019 clean. All rights reserved.
//

@testable import CleanApp
import XCTest

class MainSceneWorkerTests: XCTestCase
{
    // MARK: Subject under test
    var sut: MainSceneWorker!

    // MARK: Test lifecycle
    override func setUp()
    {
        super.setUp()
        setupMainSceneWorker()
    }

    override func tearDown()
    {
		sut = nil
        super.tearDown()
    }

    // MARK: Test setup
    func setupMainSceneWorker()
    {
        sut = MainSceneWorker()
    }

    // MARK: Tests
    func testFetchWithoutPrefix()
    {
		// Arrange
		let expectation = self.expectation(description: "items")
		var _items:[APIItemProtocol]?
        // Act
		sut.getItems(withPrefix: nil) { (items) in
			_items = items
			expectation.fulfill()
		}
		waitForExpectations(timeout: 5, handler: nil)
		// Assert
		XCTAssertNotNil(_items, "No items fetched")
    }

    func testFetchWithPrefix()
    {
		// Arrange
		let expectation = self.expectation(description: "items")
		var _items:[APIItemProtocol]?
        // Act
		sut.getItems(withPrefix: "item") { (items) in
			_items = items
			expectation.fulfill()
		}
		waitForExpectations(timeout: 5, handler: nil)
		// Assert
		XCTAssertNotNil(_items, "No items fetched")
		let hasnoprefix = _items!.filter { !($0.title.hasPrefix("item"))}
		XCTAssertEqual(hasnoprefix.count, 0, "result shouldn't have any items except with prefix \"item\"")
    }
}
