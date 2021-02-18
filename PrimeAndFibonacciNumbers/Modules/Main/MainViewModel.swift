//
//  MailViewModel.swift
//  PrimeAndFibonacciNumbers
//
//  Created by Роман Мироненко on 18.02.2021.
//

import Foundation
import BigInt

protocol MainViewModelDelegate: AnyObject {
    func appendNew(items: [String])
}

protocol MainViewModel: AnyObject {
    func loadNextPage()
}

final class MainViewModelImpl: MainViewModel {
    
    private let limit = 100
    private let numberGenerator: NumberGeneratorProtocol
    
    private var isLoading: Bool = false
    private var lastElement: BigInt?
    
    weak var delegate: MainViewModelDelegate?
    
    init(numberGenerator: NumberGeneratorProtocol) {
        self.numberGenerator = numberGenerator
    }
    
    func loadNextPage() {
        guard isLoading == false else { return }
        isLoading = true
        self.numberGenerator.generateNextNumbers(
            lastElement: lastElement,
            limit: self.limit
        ) { [weak self] newElements in
            self?.lastElement = newElements.last
            self?.delegate?.appendNew(items: newElements.map {"\($0)"})
            self?.isLoading = false
        }
    }
}
