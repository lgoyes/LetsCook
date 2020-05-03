//
//  ApplicationCoordinator.swift
//  LetsCook
//
//  Created by Luis David Goyes Garces on 5/2/20.
//  Copyright © 2020 LuisGoyes. All rights reserved.
//

import Foundation

protocol ApplicationCoordinatorType: CoordinatorType {
}

final class ApplicationCoordinator: BaseCoordinator, ApplicationCoordinatorType {
    private var restClient: ClientType
    
    
    // MARK: - Initializer
    required init(router: RouterType) {
        self.restClient = RESTClient(baseURL: DataConstants.serverURL)
        super.init(router: router)
    }
    
    override func start() {
        presentRecipeDetail()
    }
    
    // MARK - SubCoordinators
    func presentRecipeList() {
        let coordinator = fetchOrCreateListCoordinator()
        self.addDependency(coordinator)
        coordinator.start()
    }
    
    private func fetchOrCreateListCoordinator() -> RecipeListCoordinator {
        return (self.subCoordinators.first { $0 is RecipeListCoordinator } as? RecipeListCoordinator)
            ?? createListCoordinator()
    }
    
    private func createListCoordinator() -> RecipeListCoordinator {
        let coordinator = RecipeListCoordinator(router: router)
        return coordinator
    }
    
    func presentRecipeDetail() {
        let coordinator = fetchOrCreateDetailCoordinator()
        self.addDependency(coordinator)
        coordinator.start()
    }
    
    private func fetchOrCreateDetailCoordinator() -> RecipeDetailCoordinator {
        return (self.subCoordinators.first { $0 is RecipeDetailCoordinator } as? RecipeDetailCoordinator)
            ?? createDetailCoordinator()
    }
    
    private func createDetailCoordinator() -> RecipeDetailCoordinator {
        let coordinator = RecipeDetailCoordinator(router: router)
        return coordinator
    }
}
