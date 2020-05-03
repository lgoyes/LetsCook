//
//  RecipeListPresenter.swift
//  LetsCook
//
//  Created by Luis David Goyes Garces on 5/2/20.
//  Copyright © 2020 LuisGoyes. All rights reserved.
//

import Foundation

protocol RecipeListPresenterType: BasePresenterType {
    func onRecipeSelected(_ recipe: Recipe)
}

final class RecipeListPresenter: BasePresenter<RecipeListViewType, RecipeListViewController>, RecipeListPresenterType {

    struct Dependencies {
        let getRecipesInteractor: GetRecipesInteractor
        let coordinator: RecipeListCoordinatorType
    }
    
    let dependencies: Dependencies
    init(dependencies: Dependencies) {
        self.dependencies = dependencies
    }
    
    var recipes: [Recipe]?
    
    override func viewDidLoad() {
        fetchAndPresentRecipes()
    }
    
    func fetchAndPresentRecipes() {
        dependencies
            .getRecipesInteractor
            .onSuccess { [weak self] (recipes) in
                self?.recipes = recipes
                self?.view.set(data: recipes)
            }.execute()
    }
    
    func onRecipeSelected(_ recipe: Recipe) {
        dependencies
            .coordinator
            .onRecipeDetailRequested(for: recipe.id)
    }
}
