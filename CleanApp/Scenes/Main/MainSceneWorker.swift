//
//  MainSceneWorker.swift
//  CleanApp
//
//  Created by admin on 19/04/2019.
//  Copyright (c) 2019 clean. All rights reserved.
//

import UIKit

protocol APIItemProtocol {
    var title: String { get }
    var detail: String { get }
}

struct APIItem: APIItemProtocol {
    let title: String
    let detail: String
}

fileprivate let items: [APIItem] = [
    APIItem(title: "item1", detail: "detail1"),
    APIItem(title: "item2", detail: "detail2"),
    APIItem(title: "item3", detail: "detail3"),
    APIItem(title: "item4", detail: "detail4"),
    APIItem(title: "item5", detail: "detail5"),
    APIItem(title: "item6", detail: "detail6"),
    APIItem(title: "feature1", detail: "feature detail 1"),
    APIItem(title: "feature2", detail: "feature detail 2"),
    APIItem(title: "feature3", detail: "feature detail 3"),
    APIItem(title: "feature4", detail: "feature detail 4"),
    APIItem(title: "feature5", detail: "feature detail 5"),
    APIItem(title: "feature6", detail: "feature detail 6")
]

protocol MainSceneWorkerProtocol {
    func getItems(withPrefix prefix: String, completion: @escaping (_ items: [APIItemProtocol]) -> Void)
}

class MainSceneWorker: MainSceneWorkerProtocol {
    func getItems(withPrefix prefix: String, completion: @escaping ([APIItemProtocol]) -> Void) {
        let result = items.filter{ $0.title.hasPrefix(prefix)}
        completion(result)
    }
}
