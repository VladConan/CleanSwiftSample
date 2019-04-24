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
    
    func fetch(request: MainScene.Item.Request) {
        
    }
    
    func fetchItems(request: MainScene.Item.Request) {
        
    }
    
    var presenter: MainScenePresentationLogic?
    var worker: MainSceneWorker?
    //var name: String = ""
    // MARK: Do something

}
