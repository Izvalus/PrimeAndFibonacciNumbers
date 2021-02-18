//
//  MainViewModelTest.swift
//  PrimeAndFibonacciNumbersTests
//
//  Created by Роман Мироненко on 18.02.2021.
//

import XCTest
import BigInt
@testable import PrimeAndFibonacciNumbers

class MainViewModel: XCTestCase {
    
    var viewModel: MainViewModelImpl!
    var viewModelDelegate: MainViewModelDelegateMock!
    var numberGenerator: NumberGeneratorMock!
    
    let responseMock: [BigInt] = [12312, 1231]
    
    override func setUp() {
        numberGenerator = NumberGeneratorMock()
        viewModelDelegate = MainViewModelDelegateMock()
        viewModel = MainViewModelImpl(numberGenerator: numberGenerator)
        viewModel.delegate = viewModelDelegate
    }

    func testExample() throws {
        viewModel.loadNextPage()
        numberGenerator.responseBlock?(responseMock)
        XCTAssertEqual(viewModelDelegate.items.count, 2, "")
        XCTAssertEqual(viewModelDelegate.appendNewCount, 1, "")
        XCTAssertEqual(viewModelDelegate.items.count, 2, "")
        XCTAssertEqual(viewModelDelegate.items, responseMock.map{"\($0)"}, "")
    }

}
