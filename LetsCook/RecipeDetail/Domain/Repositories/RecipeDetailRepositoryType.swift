//
//  RecipeDetailRepositoryType.swift
//  LetsCook
//
//  Created by Luis David Goyes Garces on 5/2/20.
//  Copyright © 2020 LuisGoyes. All rights reserved.
//

import RxSwift

protocol RecipeDetailRepositoryType {
    func getDetail(from recipeId: Int) -> Single<RecipeDetail>
}
