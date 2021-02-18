//
//  BaseViewController.swift
//  PrimeAndFibonacciNumbers
//
//  Created by Роман Мироненко on 18.02.2021.
//

import UIKit

class BaseViewController<View>: UIViewController where View: UIView {
    
    lazy var customView = View()

    override func loadView() {
        view = customView
    }
}
