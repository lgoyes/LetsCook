//
//  MainRouter.swift
//  LetsCook
//
//  Created by Luis David Goyes Garces on 5/2/20.
//  Copyright © 2020 LuisGoyes. All rights reserved.
//

import UIKit

final class MainRouter: NSObject, RouterType {
    var navigationController: UINavigationController
    
    var rootViewController: UIViewController? {
        return navigationController.viewControllers.first
    }
    
    func toPresent() -> UIViewController {
        self.navigationController
    }
    
    init(navigationController: UINavigationController = UINavigationController()) {
        self.navigationController = navigationController
    }
    
    func push(_ module: Presentable, animated: Bool) {
        let controller = module.toPresent()
        
        // Avoid pushing UINavigationController onto stack
        guard controller is UINavigationController == false else {
            assertionFailure("Should not push UINavigationController.")
            return
        }
        
        self.navigationController.pushViewController(controller, animated: animated)
    }
}
