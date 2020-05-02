//
//  SceneDelegate.swift
//  LetsCook
//
//  Created by Luis David Goyes Garces on 5/2/20.
//  Copyright © 2020 LuisGoyes. All rights reserved.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?
//    private lazy var applicationCoordinator: ApplicationCoordinatorType = {
//        return ApplicationCoordinator(
//            router: )
//    }()

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let windowScene = (scene as? UIWindowScene) else { return }
        
        let appWindow = UIWindow(frame: windowScene.coordinateSpace.bounds)
        appWindow.windowScene = windowScene

//        appCoordinator = AppCoordinator(navigationController: navController)
//        appCoordinator.start()
//
//        appWindow.rootViewController = navController
//        appWindow.makeKeyAndVisible()
//
//        window = appWindow
    }
}

