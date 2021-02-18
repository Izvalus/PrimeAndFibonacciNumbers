//
//  MainViewModelDelegateMock.swift
//  PrimeAndFibonacciNumbersTests
//
//  Created by Роман Мироненко on 18.02.2021.
//

import XCTest
@testable import PrimeAndFibonacciNumbers

final class MainViewModelDelegateMock: MainViewModelDelegate {
    
    var appendNewCount: Int = 0
    var items = [String]()
    
    func appendNew(items: [String]) {
        appendNewCount += 1
        self.items = items
    }
}
