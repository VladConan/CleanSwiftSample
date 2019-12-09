//
//  MainSceneViewController.swift
//  CleanApp
//
//  Created by admin on 19/04/2019.
//  Copyright (c) 2019 clean. All rights reserved.
//

import UIKit
import SnapKit

protocol MainSceneDisplayLogic: class
{
	func displayItems(viewModel: MainScene.Item.ViewModel)
}

class MainSceneViewController: UIViewController
{
	// view
	var interactor: MainSceneBusinessLogic?
	var router: (MainSceneRoutingLogic & MainSceneDataPassing)?
	// display data
	var displayData: [MainScene.Item.ViewModel.ViewModelItem] = [MainScene.Item.ViewModel.ViewModelItem]()
	let tableView = UITableView()
	// MARK: Object lifecycle
	init() {
		super.init(nibName: nil, bundle: nil)
		setup()
	}
	override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?)
	{
		super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
		setup()
	}
	required init?(coder aDecoder: NSCoder)
	{
		super.init(coder: aDecoder)
		setup()
	}
	// MARK: Setup
	private func setup()
	{
		let viewController = self
		let interactor = MainSceneInteractor()
		let presenter = MainScenePresenter()
		let router = MainSceneRouter()
		viewController.interactor = interactor
		viewController.router = router
		interactor.presenter = presenter
		presenter.viewController = viewController
		router.viewController = viewController
		router.dataStore = interactor
	}
	// MARK: View lifecycle
	override func viewDidLoad()
	{
		super.viewDidLoad()
		// init ui
		self.view.addSubview(tableView)
		tableView.dataSource = self
		tableView.delegate = self
		tableView.snp.makeConstraints { (make) in
			make.edges.equalToSuperview()
		}
		getItems()
	}
	// MARK: Do something
	func getItems(prefix: String? = nil)
	{
		let request = MainScene.Item.Request.init(prefix: prefix)
		interactor?.fetchItems(request: request)
	}
}
extension MainSceneViewController: UITableViewDelegate{

}
extension MainSceneViewController: UITableViewDataSource {
	func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		return displayData.count
	}

	func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		let cell = UITableViewCell(style: .subtitle, reuseIdentifier: "some")
		let item = displayData[indexPath.row]
		cell.textLabel?.text = item.title
		cell.detailTextLabel?.text = item.detail
		return cell
	}


}
extension MainSceneViewController: MainSceneDisplayLogic {
	func displayItems(viewModel: MainScene.Item.ViewModel) {
		displayData = viewModel.items
		tableView.reloadData()
	}
}
