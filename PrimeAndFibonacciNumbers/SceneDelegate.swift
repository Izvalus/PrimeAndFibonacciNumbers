//
//  SceneDelegate.swift
//  PrimeAndFibonacciNumbers
//
//  Created by Роман Мироненко on 18.02.2021.
//

import UIKit

final class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?

    func scene(
        _ scene: UIScene,
        willConnectTo session: UISceneSession,
        options connectionOptions: UIScene.ConnectionOptions
    ) {
        guard let windowScene = scene as? UIWindowScene else { return }
        window = UIWindow(windowScene: windowScene)
        window?.rootViewController = MainTabBarFactory().create()
        window?.makeKeyAndVisible()
    }

}

