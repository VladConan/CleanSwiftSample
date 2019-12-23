//
//  MainScenePresenter.swift
//  CleanApp
//
//  Created by Vladimir Konon on 19/04/2019.
//  Copyright (c) 2019 clean. All rights reserved.
//

import UIKit

protocol MainScenePresentationLogic
{
	func presentItems(response: MainScene.Item.Response)
}

class MainScenePresenter: MainScenePresentationLogic
{
	weak var viewController: MainSceneDisplayLogic?
	func presentItems(response: MainScene.Item.Response) {
		let items = response.items.map{ MainScene.Item.ViewModel.ViewModelItem.init(title: $0.title, detail: $0.detail) }
		let viewModel = MainScene.Item.ViewModel(items: items)
		viewController?.displayItems(viewModel: viewModel)
	}
}
