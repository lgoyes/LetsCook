//
//  RecipeDetailConfigurator.swift
//  LetsCook
//
//  Created by Luis David Goyes Garces on 5/2/20.
//  Copyright © 2020 LuisGoyes. All rights reserved.
//

import Foundation

final class RecipeDetailConfigurator {
    struct Dependencies {
        let recipeId: Int
        let client: ClientType
        let coordinator: RecipeDetailCoordinatorType
    }
    
    static func configure(with dependencies: Dependencies) -> Presentable {
        let recipeDetailRepository = RecipeDetailRepository(client: dependencies.client)
        
        let getRecipeDetailInteractor = GetRecipeDetailInteractor(recipeDetailRepository: recipeDetailRepository)
        
        let presenter = RecipeDetailPresenter(dependencies: RecipeDetailPresenter.Dependencies(recipeId: dependencies.recipeId, getRecipeDetailInteractor: getRecipeDetailInteractor, coordinator: dependencies.coordinator))
        
        let viewController = RecipeDetailViewController(presenter: presenter)
        
        return viewController
    }
}
