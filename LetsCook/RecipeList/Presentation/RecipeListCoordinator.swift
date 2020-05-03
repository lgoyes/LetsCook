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

    var restClient: ClientType!
    
    // MARK: - Initializer
    override func start() {
        guard let restClient = restClient else {
            fatalError("RestClient can not be nil")
        }
        let module = RecipeListConfigurator.configure(using: RecipeListConfigurator.Dependencies(client: restClient))
        self.router.push(module, animated: true)
    }
}
