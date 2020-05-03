//
//  RecipeDetailCoordinator.swift
//  LetsCook
//
//  Created by Luis David Goyes Garces on 5/2/20.
//  Copyright © 2020 LuisGoyes. All rights reserved.
//

import Foundation

protocol RecipeDetailCoordinatorType: CoordinatorType {
}

final class RecipeDetailCoordinator: BaseCoordinator, RecipeDetailCoordinatorType {
    
    var restClient: ClientType!
    
    // MARK: - Initializer
    func start(with recipeId: Int) {
        guard let restClient = restClient else {
            fatalError("RestClient can not be nil")
        }
        let module = RecipeDetailConfigurator.configure(with: RecipeDetailConfigurator.Dependencies(recipeId: recipeId, client: restClient, coordinator: self))
        self.router.push(module, animated: true)
    }
}
