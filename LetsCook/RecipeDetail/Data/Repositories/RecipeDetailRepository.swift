//
//  RecipeDetailRepository.swift
//  LetsCook
//
//  Created by Luis David Goyes Garces on 5/2/20.
//  Copyright © 2020 LuisGoyes. All rights reserved.
//

import RxSwift

final class RecipeDetailRepository: RecipeDetailRepositoryType {

    let client: ClientType
    init(client: ClientType) {
        self.client = client
    }
    
    func getDetail(from recipeId: Int) -> Single<RecipeDetail> {
        let endpoint = Endpoint<APIRecipeDetail>(
            path: "/recipes/\(recipeId)",
            parameters: nil,
            method: HTTPMethod.get,
            contentType: APIContentType.json)
        
        return client.request(endpoint).map {
            return RecipeDetail(
                id: $0.id,
                title: $0.title,
                rating: $0.rating,
                image: $0.image,
                instructions: $0.instructions)
        }
    }
}
