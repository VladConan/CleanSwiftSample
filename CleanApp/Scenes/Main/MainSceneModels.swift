//
//  MainSceneModels.swift
//  CleanApp
//
//  Created by admin on 19/04/2019.
//  Copyright (c) 2019 clean. All rights reserved.
//

import UIKit

enum MainScene
{
	// MARK: Use cases
	enum Item
	{
		struct Request
		{
			let prefix: String?
		}
		struct Response
		{
			struct DataItem {
				let title: String
				let detail: String
			}
			let items: [DataItem]
		}
		struct ViewModel
		{
			struct ViewModelItem {
				let title: String
				let detail: String
			}
			let items: [ViewModelItem]
		}
	}
}
