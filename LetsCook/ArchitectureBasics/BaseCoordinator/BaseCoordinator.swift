//
//  BaseCoordinator.swift
//  LetsCook
//
//  Created by Luis David Goyes Garces on 5/2/20.
//  Copyright © 2020 LuisGoyes. All rights reserved.
//

import UIKit

class BaseCoordinator: CoordinatorType {
    
    var router: RouterType
    var subCoordinators: [CoordinatorType]
    
    required init(router: RouterType) {
        self.router = router
        self.subCoordinators = []
    }
}
