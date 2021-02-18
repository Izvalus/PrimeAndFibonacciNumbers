//
//  NumberGeneratorMock.swift
//  PrimeAndFibonacciNumbersTests
//
//  Created by Роман Мироненко on 18.02.2021.
//

import Foundation
import BigInt
@testable import PrimeAndFibonacciNumbers

final class NumberGeneratorMock: NumberGeneratorProtocol {
    
    var lastElementMock: BigInt?
    var limitMock: Int = 0
    var responseBlock: Handler<[BigInt]>?
    
    func generateNextNumbers(
        lastElement: BigInt?,
        limit: Int,
        responseBlock: @escaping Handler<[BigInt]>
    ) {
        self.lastElementMock = lastElement
        self.limitMock = limit
        self.responseBlock = responseBlock
    }
}
