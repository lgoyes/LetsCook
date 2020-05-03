//
//  ApplicationConfigurator.swift
//  LetsCook
//
//  Created by Luis David Goyes Garces on 5/2/20.
//  Copyright © 2020 LuisGoyes. All rights reserved.
//

import Foundation

final class ApplicationConfigurator {
    static func configure() -> Presentable {
        let presenter = ApplicationPresenter()
        
        let viewController = ApplicationViewController(presenter: presenter)
        
        return viewController
    }
}
