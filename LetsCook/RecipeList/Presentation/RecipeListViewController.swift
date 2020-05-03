//
//  RecipeListViewController.swift
//  LetsCook
//
//  Created by Luis David Goyes Garces on 5/2/20.
//  Copyright © 2020 LuisGoyes. All rights reserved.
//

import UIKit

protocol RecipeListViewType: BaseViewType {
    func set(data: [Recipe])
}

final class RecipeListViewController: BaseViewController<RecipeListPresenterType> {
    
    lazy var adapter: RecipeTableViewAdapter = {
        let adapter = RecipeTableViewAdapter()
        adapter.delegate = self
        return adapter
    }()
    
    private var content: RecipeListUIViewType {
        return self.view as! RecipeListUIViewType
    }
    
    var searchController: UISearchController!
    
    override func viewDidLoad() {
        presenter.bind(view: self)
        super.viewDidLoad()
        searchController = prepareSeachController()
    }
    
    override func loadView() {
        let view = RecipeListView()
        adapter.attach(to: view.tableView)
        self.view = view
    }
    
    func prepareSeachController() -> UISearchController {
        let searchController = UISearchController(searchResultsController: nil)
        searchController.searchResultsUpdater = self
        searchController.obscuresBackgroundDuringPresentation = false
        navigationItem.searchController = searchController
        return searchController
    }
}

extension RecipeListViewController: RecipeListViewType {
    func set(data: [Recipe]) {
        (view as? RecipeListUIViewType)?.showTable()
        adapter.set(data: data)
    }
}

extension RecipeListViewController: RecipeTableViewAdapterDelegate {
    func tableViewAdapter(didSelectRecipe recipe: Recipe) {
        presenter.onRecipeSelected(recipe)
    }
}

extension RecipeListViewController: UISearchResultsUpdating {
    func updateSearchResults(for searchController: UISearchController) {
        adapter.setFilterString(searchController.searchBar.text ?? "")
    }
}
