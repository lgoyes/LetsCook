//
//  ApplicationCoordinator.swift
//  LetsCook
//
//  Created by Luis David Goyes Garces on 5/2/20.
//  Copyright © 2020 LuisGoyes. All rights reserved.
//

import Foundation

protocol RecipeListCoordinatorDelegate: AnyObject {
    func onRecipeDetailRequested(for recipeId: Int)
}

protocol ApplicationCoordinatorType: CoordinatorType {
}

final class ApplicationCoordinator: BaseCoordinator, ApplicationCoordinatorType {
    var restClient: ClientType
    
    // MARK: - Initializer
    required init(router: RouterType) {
        self.restClient = RESTClient(baseURL: DataConstants.serverURL)
        super.init(router: router)
    }
    
    override func start() {
        presentRecipeList()
    }
    
    // MARK - RecipeList sub-coordinator
    func presentRecipeList() {
        let coordinator = fetchOrCreateListCoordinator()
        self.addDependency(coordinator)
        coordinator.start()
    }
    
    func fetchOrCreateListCoordinator() -> RecipeListCoordinator {
        return (self.subCoordinators.first { $0 is RecipeListCoordinator } as? RecipeListCoordinator)
            ?? createListCoordinator()
    }
    
    func createListCoordinator() -> RecipeListCoordinator {
        let coordinator = RecipeListCoordinator(router: router)
        coordinator.restClient = restClient
        coordinator.delegate = self
        return coordinator
    }
    
    // MARK - RecipeDetail sub-coordinator
    func presentRecipeDetail(withId recipeId: Int) {
        let coordinator = fetchOrCreateDetailCoordinator()
        self.addDependency(coordinator)
        coordinator.start(with: recipeId)
    }
    
    func fetchOrCreateDetailCoordinator() -> RecipeDetailCoordinator {
        return (self.subCoordinators.first { $0 is RecipeDetailCoordinator } as? RecipeDetailCoordinator)
            ?? createDetailCoordinator()
    }
    
    func createDetailCoordinator() -> RecipeDetailCoordinator {
        let coordinator = RecipeDetailCoordinator(router: router)
        coordinator.restClient = restClient
        return coordinator
    }
}

extension ApplicationCoordinator: RecipeListCoordinatorDelegate {
    func onRecipeDetailRequested(for recipeId: Int) {
        presentRecipeDetail(withId: recipeId)
    }
}
