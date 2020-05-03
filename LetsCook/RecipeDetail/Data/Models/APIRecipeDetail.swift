//
//  APIRecipeDetail.swift
//  LetsCook
//
//  Created by Luis David Goyes Garces on 5/2/20.
//  Copyright © 2020 LuisGoyes. All rights reserved.
//

import Foundation

struct APIRecipeDetail: Codable {
    let id: Int
    let title: String
    let rating: Int
    let image: String
    let instructions: String
}
