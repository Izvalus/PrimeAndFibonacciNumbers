//
//  FibonacciNumberGenerator.swift
//  PrimeAndFibonacciNumbers
//
//  Created by Роман Мироненко on 18.02.2021.
//

import Foundation
import BigInt

final class FibonacciNumberGenerator: NumberGeneratorProtocol {
    
    private var count: BigInt = 0
    private let numberWorkers: Int = 10
    
    private let concurentQueue = DispatchQueue(
        label: "fibonacci.numberGenerator.concurentQueue",
        qos: .userInteractive,
        attributes: .concurrent,
        autoreleaseFrequency: .workItem
    )
    
    private let writeSerialQueue = DispatchQueue(
        label: "fibonacci.numberGenerator.writeSerialQueue",
        qos: .userInteractive
    )
    
    private func fib(_ n: BigInt) -> BigInt {
        var a: BigInt = 1
        var b: BigInt = 1
        guard n > 1 else { return a }
        
        (2...n).forEach { _ in
            (a, b) = (a + b, a)
        }
        return a
    }
    
    func generateNextNumbers(
        lastElement: BigInt?,
        limit: Int,
        responseBlock: @escaping Handler<[BigInt]>
    ) {
        DispatchQueue.global(qos: .userInteractive).async {

            let dispatchGroup = DispatchGroup()

            var listFibonacci: [BigInt] = (0...limit).map { _ in 0 }

            let dispatchSemaphore = DispatchSemaphore(value: self.numberWorkers)

            for (index, element) in (BigInt(self.count)...BigInt(limit) + self.count).enumerated() {
                dispatchGroup.enter()
                dispatchSemaphore.wait()
                let workItem = DispatchWorkItem {
                    let newElement = self.fib(element)
                    dispatchSemaphore.signal()
                    self.writeSerialQueue.async {
                        listFibonacci[index] = newElement
                        dispatchGroup.leave()
                    }
                }
                self.concurentQueue.async(execute: workItem)
            }
            dispatchGroup.notify(queue: .main) {
                if self.count == 0 {
                    listFibonacci.insert(0, at: 0)
                }
                self.count += BigInt(limit)
                responseBlock(listFibonacci.compactMap { $0 })
            }
        }
    }
    
}
