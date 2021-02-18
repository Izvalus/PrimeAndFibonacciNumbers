//
//  PrimeNumberGenerator.swift
//  PrimeAndFibonacciNumbers
//
//  Created by Роман Мироненко on 18.02.2021.
//

import Foundation
import BigInt

final class PrimeNumberGenerator: NumberGeneratorProtocol {
    
    func generateNextNumbers(
        lastElement: BigInt?,
        limit: Int,
        responseBlock: @escaping Handler<[BigInt]>
    ) {
        DispatchQueue.global(qos: .userInteractive).async {
            var resultList = [BigInt]()
            resultList.reserveCapacity(limit)
            var currentElement = (lastElement ?? 1) + 1
            while resultList.count != limit {
                if currentElement.isPrime() {
                    resultList.append(currentElement)
                }
                currentElement += 1
            }
            DispatchQueue.main.async {
                responseBlock(resultList)
            }
        }
    }
    
}
