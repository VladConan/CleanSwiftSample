//
//  SecondViewController.swift
//  CleanApp
//
//  Created by Vladimir Konon on 19/04/2019.
//  Copyright (c) 2019 clean. All rights reserved.
//

import UIKit

protocol SecondDisplayLogic: AnyObject
{
    func displaySomething(viewModel: Second.Something.ViewModel)
}

class SecondViewController: UIViewController, SecondDisplayLogic
{
    var interactor: SecondBusinessLogic?
    var router: (SecondRoutingLogic & SecondDataPassing)?
    // MARK: Object lifecycle
    init () {
        super.init(nibName: nil, bundle: nil)
        setup()
    }
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?)
    {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
        setup()
    }
    required init?(coder aDecoder: NSCoder)
    {
        super.init(coder: aDecoder)
        setup()
    }
    // MARK: Setup
    private func setup()
    {
        let viewController = self
        let interactor = SecondInteractor()
        let presenter = SecondPresenter()
        let router = SecondRouter()
        viewController.interactor = interactor
        viewController.router = router
        interactor.presenter = presenter
        presenter.viewController = viewController
        router.viewController = viewController
        router.dataStore = interactor
    }
    // MARK: View lifecycle
    override func viewDidLoad()
    {
        super.viewDidLoad()
        doSomething()
    }
    // MARK: Do something
    func doSomething()
    {
        let request = Second.Something.Request()
        interactor?.doSomething(request: request)
    }
    func displaySomething(viewModel: Second.Something.ViewModel)
    {
        //update view by view model
    }
}
