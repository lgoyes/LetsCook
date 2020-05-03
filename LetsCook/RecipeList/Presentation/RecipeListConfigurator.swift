//
//  RecipeListConfigurator.swift
//  LetsCook
//
//  Created by Luis David Goyes Garces on 5/2/20.
//  Copyright © 2020 LuisGoyes. All rights reserved.
//

import Foundation

final class RecipeListConfigurator {
    static func configure() -> Presentable {
        let presenter = RecipeListPresenter()
        
        let viewController = RecipeListViewController(presenter: presenter)
        
        return viewController
    }
}
