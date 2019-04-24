//
//  MainSceneRouter.swift
//  CleanApp
//
//  Created by admin on 19/04/2019.
//  Copyright (c) 2019 clean. All rights reserved.
//

import UIKit

protocol MainSceneRoutingLogic
{
    //func routeToSomewhere(segue: UIStoryboardSegue?)
}

protocol MainSceneDataPassing
{
    var dataStore: MainSceneDataStore? { get }
}

class MainSceneRouter: MainSceneRoutingLogic, MainSceneDataPassing
{
    weak var viewController: MainSceneViewController?
    var dataStore: MainSceneDataStore?
    // MARK: Navigation
    //func navigateToSomewhere(source: MainSceneViewController, destination: SomewhereViewController)
    //{
    //  source.show(destination, sender: nil)
    //}
    // MARK: Passing data
    //func passDataToSomewhere(source: MainSceneDataStore, destination: inout SomewhereDataStore)
    //{
    //  destination.name = source.name
    //}
}
