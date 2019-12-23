//
//  MainSceneViewControllerTests.swift
//  CleanApp
//
//  Created by Vladimir on 23.12.2019.
//  Copyright (c) 2019 clean. All rights reserved.
//

@testable import CleanApp
import XCTest

class MainSceneViewControllerTests: XCTestCase
{
    // MARK: Subject under test
    var sut: MainSceneViewController!
    var window: UIWindow!
    // MARK: Test lifecycle
    override func setUp()
    {
        super.setUp()
        window = UIWindow()
        setupMainSceneViewController()
    }
    override func tearDown()
    {
        window = nil
		sut = nil
        super.tearDown()
    }
    // MARK: Test setup
    func setupMainSceneViewController()
    {
        sut = MainSceneViewController()
    }
    func loadView()
    {
        window.addSubview(sut.view)
        RunLoop.current.run(until: Date())
    }
    // MARK: Test doubles
    class MainSceneBusinessLogicMock: MainSceneBusinessLogic
	{
		var itemsFetched = false
		func fetchItems(request: MainScene.Item.Request) {
			itemsFetched = true
		}
    }
    // MARK: Tests
    func testShouldDoFetchItemsWhenViewIsLoaded()
    {
        // Arrange
        let mock = MainSceneBusinessLogicMock()
        sut.interactor = mock
        // Act
        loadView()
        // Assert
		XCTAssertTrue(mock.itemsFetched, "viewDidLoad() should ask the interactor to do something")
    }
    func testDisplayItems()
    {
        // Arrange
		let viewModel = MainScene.Item.ViewModel(items: [MainScene.Item.ViewModel.ViewModelItem(title: "title", detail: "detail")])
        // Act
        loadView()
		sut.displayItems(viewModel: viewModel)
        // Assert
		XCTAssertEqual(sut.tableView.numberOfRows(inSection: 0), 1, "displayItems(viewModel:) should update table view")
    }
}
