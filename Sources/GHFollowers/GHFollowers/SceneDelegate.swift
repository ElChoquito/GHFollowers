//
//  SceneDelegate.swift
//  GHFollowers
//
//  Created by Sylvain Guillier on 11/18/20.
//  Copyright © 2019 Sean Allen. All rights reserved.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {
    var window: UIWindow?
    
    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let windowScene = (scene as? UIWindowScene) else { return }
        
        window = UIWindow(frame: windowScene.coordinateSpace.bounds)
        window?.windowScene = windowScene
        window?.rootViewController = GFTabBarController()
        window?.makeKeyAndVisible()
        
        configureNavigationBar()
    }
    
    func configureNavigationBar() {
        UINavigationBar.appearance().tintColor = .systemGreen
    }
}

