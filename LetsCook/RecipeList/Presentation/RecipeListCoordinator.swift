//
//  RecipeListCoordinator.swift
//  LetsCook
//
//  Created by Luis David Goyes Garces on 5/2/20.
//  Copyright © 2020 LuisGoyes. All rights reserved.
//

import Foundation

protocol RecipeListCoordinatorType: CoordinatorType {
}

final class RecipeListCoordinator: BaseCoordinator, RecipeListCoordinatorType {
    // MARK: - Initializer
    override func start() {
        let module = RecipeListConfigurator.configure()
        self.router.push(module, animated: true)
    }
}
