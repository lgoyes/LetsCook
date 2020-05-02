//
//  RouterSpy.swift
//  LetsCookTests
//
//  Created by Luis David Goyes Garces on 5/2/20.
//  Copyright © 2020 LuisGoyes. All rights reserved.
//

import UIKit
@testable import LetsCook

final class RouterSpy: RouterType {
    var navigationController: UINavigationController = UINavigationController()
    
    var rootViewController: UIViewController?
    
    var toPresentCallback: (() -> ())?
    
    func toPresent() -> UIViewController {
        toPresentCallback?()
        return self.navigationController
    }
}
