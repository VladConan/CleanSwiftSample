//
//  MainSceneInteractorTests.swift
//  CleanApp
//
//  Created by Vladimir on 23.12.2019.
//  Copyright (c) 2019 clean. All rights reserved.
//

@testable import CleanApp
import XCTest

class MainSceneInteractorTests: XCTestCase
{
    // MARK: Subject under test
    var sut: MainSceneInteractor!
    // MARK: Test lifecycle
    override func setUp()
    {
        super.setUp()
        setupMainSceneInteractor()
    }
    override func tearDown()
    {
		sut = nil
        super.tearDown()
    }
    // MARK: Test setup
    func setupMainSceneInteractor()
    {
        sut = MainSceneInteractor()
    }
    // MARK: Test doubles
    class MainScenePresentationLogicMock: MainScenePresentationLogic
	{
		var presentItemsCalled = false
		func presentItems(response: MainScene.Item.Response) {
			presentItemsCalled = true
		}
    }
    // MARK: Tests
    func testFetchItems()
    {
        // Arrange
        let mock = MainScenePresentationLogicMock()
        sut.presenter = mock
		let request = MainScene.Item.Request(prefix: nil)
        // Act
        sut.fetchItems(request: request)
        // Assert
        XCTAssertTrue(mock.presentItemsCalled, "fetchItems(request:) should ask the presenter to format the result")
    }
}
