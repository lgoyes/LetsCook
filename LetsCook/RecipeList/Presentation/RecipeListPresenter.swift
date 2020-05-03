//
//  RecipeListPresenter.swift
//  LetsCook
//
//  Created by Luis David Goyes Garces on 5/2/20.
//  Copyright © 2020 LuisGoyes. All rights reserved.
//

import Foundation

protocol RecipeListPresenterType: BasePresenterType {
    
}

final class RecipeListPresenter: BasePresenter<RecipeListViewType, RecipeListViewController>, RecipeListPresenterType {
    
    override func viewDidLoad() {
        // get data
        view.set(data: [
            Recipe(id: 1, title: "Test recipe")
        ])
    }
}
