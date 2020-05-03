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
    
    struct Dependencies {
        let getRecipesInteractor: GetRecipesInteractor
    }
    
    let dependencies: Dependencies
    init(dependencies: Dependencies) {
        self.dependencies = dependencies
    }
    
    override func viewDidLoad() {
        fetchAndPresentRecipes()
    }
    
    func fetchAndPresentRecipes() {
        dependencies
            .getRecipesInteractor
            .onSuccess { [weak self] (recipes) in
                self?.view.set(data: recipes)
            }.execute()
    }
}
