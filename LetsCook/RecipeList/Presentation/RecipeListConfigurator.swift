//
//  RecipeListConfigurator.swift
//  LetsCook
//
//  Created by Luis David Goyes Garces on 5/2/20.
//  Copyright © 2020 LuisGoyes. All rights reserved.
//

import Foundation

final class RecipeListConfigurator {
    struct Dependencies {
        let client: ClientType
        let coordinator: RecipeListCoordinatorType
    }
    
    static func configure(using dependencies: Dependencies) -> Presentable {
        let recipeListRepository = RecipeListRepository(client: dependencies.client)
        
        let getRecipesInteractor = GetRecipesInteractor(recipeListRepository: recipeListRepository)
        
        let presenter = RecipeListPresenter(dependencies: RecipeListPresenter.Dependencies(getRecipesInteractor: getRecipesInteractor, coordinator: dependencies.coordinator))
        
        let viewController = RecipeListViewController(presenter: presenter)
        
        return viewController
    }
}
