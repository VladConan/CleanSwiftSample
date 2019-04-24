//
//  MainScenePresenter.swift
//  CleanApp
//
//  Created by admin on 19/04/2019.
//  Copyright (c) 2019 clean. All rights reserved.
//

import UIKit

protocol MainScenePresentationLogic
{
    func presentItems(response: MainScene.Item.Response)
}

class MainScenePresenter: MainScenePresentationLogic
{
    func present(response: MainScene.Item.Response) {
        let viewModels = response.items.map{ MainScene.Item.ViewModel.ViewModelItem.init(title: $0.title, detail: $0.detail) }
        
    }
    
    weak var viewController: MainSceneDisplayLogic?
    // MARK: Do something
    func presentSomething(response: MainScene.Item.Response)
    {
        let viewModel = MainScene.Item.ViewModel()
        viewController?.displaySomething(viewModel: viewModel)
    }
}
