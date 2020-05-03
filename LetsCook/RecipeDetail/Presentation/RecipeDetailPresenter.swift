//
//  RecipeDetailPresenter.swift
//  LetsCook
//
//  Created by Luis David Goyes Garces on 5/2/20.
//  Copyright © 2020 LuisGoyes. All rights reserved.
//

import Foundation

protocol RecipeDetailPresenterType: BasePresenterType {
    
}

final class RecipeDetailPresenter: BasePresenter<RecipeDetailViewType, RecipeDetailViewController>, RecipeDetailPresenterType {
    struct Dependencies {
        let recipeId: Int
        let getRecipeDetailInteractor: GetRecipeDetailInteractor
        let coordinator: RecipeDetailCoordinatorType
    }
    
    let dependencies: Dependencies
    init(dependencies: Dependencies) {
        self.dependencies = dependencies
    }
    
    var recipeDetail: RecipeDetail?
    
    override func viewDidLoad() {
        fetchAndPresentRecipeDetails()
    }
    
    func fetchAndPresentRecipeDetails() {
        let recipeId = self.dependencies.recipeId
        
        self.dependencies
            .getRecipeDetailInteractor
            .params(recipeId)
            .onSuccess({ [weak self] (recipeDetail) in
                self?.recipeDetail = recipeDetail
                self?.view.drawView(with: recipeDetail)
            })
            .execute()
    }
}
