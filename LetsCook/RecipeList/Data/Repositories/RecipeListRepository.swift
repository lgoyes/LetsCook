//
//  RecipeListRepository.swift
//  LetsCook
//
//  Created by Luis David Goyes Garces on 5/2/20.
//  Copyright © 2020 LuisGoyes. All rights reserved.
//

import RxSwift

final class RecipeListRepository: RecipeListRepositoryType {
    let client: ClientType
    init(client: ClientType) {
        self.client = client
    }
    
    func getRecipes() -> Single<[Recipe]> {
        let endpoint = Endpoint<[APIRecipe]>(
            path: "/recipes",
            parameters: nil,
            method: HTTPMethod.get,
            contentType: APIContentType.json)
        
        return client.request(endpoint).map {
            return $0.map {
                Recipe(id: $0.id, title: $0.title)
            }
        }
    }
}
