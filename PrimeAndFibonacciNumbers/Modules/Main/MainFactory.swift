//
//  MainFactory.swift
//  PrimeAndFibonacciNumbers
//
//  Created by Роман Мироненко on 18.02.2021.
//

import UIKit

struct MainFactory {
    
    func createPrimeViewController() -> UIViewController {
        create(numberGenerator: PrimeNumberGenerator(), title: "Prime")
    }
    
    func createFibonacciViewController() -> UIViewController{
        create(numberGenerator: FibonacciNumberGenerator(), title: "Fibonacci")
    }
    
    private func create(
        numberGenerator: NumberGeneratorProtocol,
        title: String
    ) -> UIViewController {
        let viewModel = MainViewModelImpl(numberGenerator: numberGenerator)
        let mainViewController = MainViewController(viewModel: viewModel, title: title)
        viewModel.delegate = mainViewController
        return mainViewController
    }
    
}
