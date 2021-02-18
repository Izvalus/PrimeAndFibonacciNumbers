//
//  MainTabBarFactory.swift
//  PrimeAndFibonacciNumbers
//
//  Created by Роман Мироненко on 18.02.2021.
//

import UIKit

struct MainTabBarFactory {
    func create() -> UIViewController {
        let primeItem = MainTabBar.Item(
            controller: UINavigationController(rootViewController: MainFactory().createPrimeViewController()),
            title: "Prime",
            image: UIImage(systemName: "p.square")
        )
        
        let fibonacciItem = MainTabBar.Item(
            controller: UINavigationController(rootViewController: MainFactory().createFibonacciViewController()),
            title: "Fibonacci",
            image: UIImage(systemName: "f.square")
        )
        
        let mainTabBar = MainTabBar(items: [primeItem, fibonacciItem])
        return mainTabBar
    }
    
}
