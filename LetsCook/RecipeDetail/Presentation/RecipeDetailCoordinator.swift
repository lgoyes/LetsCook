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
    // MARK: - Initializer
    override func start() {
        let module = RecipeDetailConfigurator.configure()
        self.router.push(module, animated: true)
    }
}
