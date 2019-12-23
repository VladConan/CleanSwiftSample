//
//  SecondInteractor.swift
//  CleanApp
//
//  Created by Vladimir Konon on 19/04/2019.
//  Copyright (c) 2019 clean. All rights reserved.
//

import UIKit

protocol SecondBusinessLogic
{
    func doSomething(request: Second.Something.Request)
}

protocol SecondDataStore
{
    //var name: String { get set }
}

class SecondInteractor: SecondBusinessLogic, SecondDataStore
{
    var presenter: SecondPresentationLogic?
    var worker: SecondWorker?
    //var name: String = ""
    // MARK: Do something
    func doSomething(request: Second.Something.Request)
    {
        worker = SecondWorker()
        worker?.doSomeWork()
        let response = Second.Something.Response()
        presenter?.presentSomething(response: response)
    }
}
