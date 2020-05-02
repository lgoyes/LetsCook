//
//  CoordinatorType.swift
//  LetsCook
//
//  Created by Luis David Goyes Garces on 5/2/20.
//  Copyright © 2020 LuisGoyes. All rights reserved.
//

import UIKit

protocol CoordinatorType: AnyObject, Presentable {
    
    var subCoordinators: [CoordinatorType] { get set }
    var router: RouterType { get }
    
    init(router: RouterType)
    func start()
    func addDependency(_ coordinator: CoordinatorType)
    func removeDependency(_ coordinator: CoordinatorType?)
    func toPresent() -> UIViewController
}

extension CoordinatorType {
    func start() {
        
    }
    
    func addDependency(_ coordinator: CoordinatorType) {
        for element in subCoordinators where element === coordinator {
            return
        }
        subCoordinators.append(coordinator)
    }
    
    func removeDependency(_ coordinator: CoordinatorType?) {
        guard subCoordinators.isEmpty == false, let coordinator = coordinator else { return }
        
        for (index, element) in subCoordinators.enumerated() where element === coordinator {
            subCoordinators.remove(at: index)
            break
        }
    }
    
    func toPresent() -> UIViewController {
        let viewController = router.toPresent()
        viewController.modalPresentationStyle = .overFullScreen
        return viewController
    }
}
