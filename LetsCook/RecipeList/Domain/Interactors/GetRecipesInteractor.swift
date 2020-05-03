//
//  GetRecipesInteractor.swift
//  LetsCook
//
//  Created by Luis David Goyes Garces on 5/2/20.
//  Copyright © 2020 LuisGoyes. All rights reserved.
//

import RxSwift

final class GetRecipesInteractor: SingleInteractor<[Recipe],Void> {
    
    let recipeListRepository: RecipeListRepositoryType
    init(recipeListRepository: RecipeListRepositoryType) {
        self.recipeListRepository = recipeListRepository
    }
    
    override func buildUseCase(params: Void?) -> Single<[Recipe]> {
        return recipeListRepository.getRecipes()
    }
}
