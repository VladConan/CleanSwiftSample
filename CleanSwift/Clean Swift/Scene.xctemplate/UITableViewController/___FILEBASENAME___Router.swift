//
//  ___FILENAME___
//  ___PROJECTNAME___
//
//  Created by ___FULLUSERNAME___ on ___DATE___.
//  Copyright (c) ___YEAR___ ___ORGANIZATIONNAME___. All rights reserved.
//

import UIKit

protocol ___VARIABLE_sceneName___RoutingLogic {
	//func routeToSomewhere(segue: UIStoryboardSegue?)
}

protocol ___VARIABLE_sceneName___DataPassing {
	var dataStore: ___VARIABLE_sceneName___DataStore? { get }
}

class ___VARIABLE_sceneName___Router: ___VARIABLE_sceneName___RoutingLogic, ___VARIABLE_sceneName___DataPassing {
	weak var viewController: ___VARIABLE_sceneName___ViewController?
	var dataStore: ___VARIABLE_sceneName___DataStore?
	// MARK: Navigation
	//func navigateToSomewhere(source: ___VARIABLE_sceneName___ViewController, destination: SomewhereViewController)
	//{
	//  source.show(destination, sender: nil)
	//}
	// MARK: Passing data
	//func passDataToSomewhere(source: ___VARIABLE_sceneName___DataStore, destination: inout SomewhereDataStore)
	//{
	//  destination.name = source.name
	//}
}
