//
//  MainScenePresenterTests.swift
//  CleanApp
//
//  Created by Vladimir on 23.12.2019.
//  Copyright (c) 2019 clean. All rights reserved.
//

@testable import CleanApp
import XCTest

class MainScenePresenterTests: XCTestCase
{
    // MARK: Subject under test
    var sut: MainScenePresenter!

    // MARK: Test lifecycle
    override func setUp()
    {
        super.setUp()
        setupMainScenePresenter()
    }

    override func tearDown()
    {
		sut = nil
        super.tearDown()
    }

    // MARK: Test setup
    func setupMainScenePresenter()
    {
        sut = MainScenePresenter()
    }

    // MARK: Test doubles
    class MainSceneDisplayLogicMock: MainSceneDisplayLogic
	{
		var displayItemsCalled = false
		func displayItems(viewModel: MainScene.Item.ViewModel) {
			displayItemsCalled = true
		}
    }
	
    // MARK: Tests
    func testPresentSomething()
    {
        // Arrange
        let mock = MainSceneDisplayLogicMock()
        sut.viewController = mock
		let response = MainScene.Item.Response(items: [])
        // Act
        sut.presentItems(response: response)
        // Assert
        XCTAssertTrue(mock.displayItemsCalled, "presentItems(response:) should ask the view controller to display the result")
    }
}
