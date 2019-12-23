//
//  SecondRouter.swift
//  CleanApp
//
//  Created by Vladimir Konon on 19/04/2019.
//  Copyright (c) 2019 clean. All rights reserved.
//

import UIKit

protocol SecondRoutingLogic
{
    //func routeToSomewhere(segue: UIStoryboardSegue?)
}

protocol SecondDataPassing
{
    var dataStore: SecondDataStore? { get }
}

class SecondRouter: SecondRoutingLogic, SecondDataPassing
{
    weak var viewController: SecondViewController?
    var dataStore: SecondDataStore?
    // MARK: Navigation
    //func navigateToSomewhere(source: SecondViewController, destination: SomewhereViewController)
    //{
    //  source.show(destination, sender: nil)
    //}
    // MARK: Passing data
    //func passDataToSomewhere(source: SecondDataStore, destination: inout SomewhereDataStore)
    //{
    //  destination.name = source.name
    //}
}
