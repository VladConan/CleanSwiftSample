//
//  ___FILENAME___
//  ___PROJECTNAME___
//
//  Created by ___FULLUSERNAME___ on ___DATE___.
//  Copyright (c) ___YEAR___ ___ORGANIZATIONNAME___. All rights reserved.
//

@testable import ___PROJECTNAMEASIDENTIFIER___
import XCTest

class ___VARIABLE_sceneName___InteractorTests: XCTestCase
{
    // MARK: Subject under test
    var sut: ___VARIABLE_sceneName___Interactor!
    // MARK: Test lifecycle
    override func setUp()
    {
        super.setUp()
        setup___VARIABLE_sceneName___Interactor()
    }
    override func tearDown()
    {
        super.tearDown()
    }
    // MARK: Test setup
    func setup___VARIABLE_sceneName___Interactor()
    {
        sut = ___VARIABLE_sceneName___Interactor()
    }
    // MARK: Test doubles
    class ___VARIABLE_sceneName___PresentationLogicMock: ___VARIABLE_sceneName___PresentationLogic
    {
        var presentSomethingCalled = false
        func presentSomething(response: ___VARIABLE_sceneName___.Something.Response)
        {
            presentSomethingCalled = true
        }
    }
    // MARK: Tests
    func testDoSomething()
    {
        // Arrange
        let mock = ___VARIABLE_sceneName___PresentationLogicMock()
        sut.presenter = mock
        let request = ___VARIABLE_sceneName___.Something.Request()
        // Act
        sut.doSomething(request: request)
        // Assert
        XCTAssertTrue(mock.presentSomethingCalled, "doSomething(request:) should ask the presenter to format the result")
    }
}
