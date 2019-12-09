//
//  MainSceneInteractor.swift
//  CleanApp
//
//  Created by admin on 19/04/2019.
//  Copyright (c) 2019 clean. All rights reserved.
//

import UIKit

protocol MainSceneBusinessLogic
{
	func fetchItems(request: MainScene.Item.Request)
}

protocol MainSceneDataStore
{
	var requestItems: MainScene.Item.Response.DataItem? { get set }
}

class MainSceneInteractor: MainSceneBusinessLogic, MainSceneDataStore
{
	var requestItems: MainScene.Item.Response.DataItem?
	var presenter: MainScenePresentationLogic?
	var worker: MainSceneWorkerProtocol = MainSceneWorker()
	func fetch(request: MainScene.Item.Request) {

	}

	func fetchItems(request: MainScene.Item.Request) {
		weak  var wself = self
		worker.getItems(withPrefix: request.prefix) { items in
			if let self = wself {
				let items =  items.map{ MainScene.Item.Response.DataItem(title: $0.title, detail: $0.detail) }
				self.presenter?.presentItems(response: MainScene.Item.Response(items: items))
				}
		}
	}

}
