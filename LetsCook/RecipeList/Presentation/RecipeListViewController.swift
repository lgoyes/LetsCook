//
//  RecipeListViewController.swift
//  LetsCook
//
//  Created by Luis David Goyes Garces on 5/2/20.
//  Copyright © 2020 LuisGoyes. All rights reserved.
//

import Foundation

protocol RecipeListViewType: BaseViewType {
    func set(data: [Recipe])
}

final class RecipeListViewController: BaseViewController<RecipeListPresenterType> {
    
    let adapter = RecipeTableViewAdapter()
    
    private var content: RecipeListUIViewType {
        return self.view as! RecipeListUIViewType
    }
    
    override func viewDidLoad() {
        presenter.bind(view: self)
        super.viewDidLoad()
    }
    
    override func loadView() {
        let view = RecipeListView()
        adapter.attach(to: view.tableView)
        self.view = view
    }
}

extension RecipeListViewController: RecipeListViewType {
    func set(data: [Recipe]) {
        adapter.set(data: data)
    }
}
