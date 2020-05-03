//
//  RecipeDetailConfigurator.swift
//  LetsCook
//
//  Created by Luis David Goyes Garces on 5/2/20.
//  Copyright © 2020 LuisGoyes. All rights reserved.
//

import Foundation

final class RecipeDetailConfigurator {
    static func configure() -> Presentable {
        let presenter = RecipeDetailPresenter()
        
        let viewController = RecipeDetailViewController(presenter: presenter)
        
        return viewController
    }
}
