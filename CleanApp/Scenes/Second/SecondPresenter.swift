//
//  SecondPresenter.swift
//  CleanApp
//
//  Created by admin on 19/04/2019.
//  Copyright (c) 2019 clean. All rights reserved.
//

import UIKit

protocol SecondPresentationLogic
{
    func presentSomething(response: Second.Something.Response)
}

class SecondPresenter: SecondPresentationLogic
{
    weak var viewController: SecondDisplayLogic?
    // MARK: Do something
    func presentSomething(response: Second.Something.Response)
    {
        let viewModel = Second.Something.ViewModel()
        viewController?.displaySomething(viewModel: viewModel)
    }
}
