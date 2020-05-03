//
//  GetRecipeDetailInteractor.swift
//  LetsCook
//
//  Created by Luis David Goyes Garces on 5/2/20.
//  Copyright © 2020 LuisGoyes. All rights reserved.
//

import RxSwift

final class GetRecipeDetailInteractor: SingleInteractor<RecipeDetail,Int> {
    
    let recipeDetailRepository: RecipeDetailRepositoryType
    init(recipeDetailRepository: RecipeDetailRepositoryType) {
        self.recipeDetailRepository = recipeDetailRepository
    }
    
    override func buildUseCase(params: Int?) -> Single<RecipeDetail> {
        guard let params = params else {
            fatalError("recipeId was not supposed to be nil")
        }
        return recipeDetailRepository.getDetail(from: params)
    }
}
