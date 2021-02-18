//
//  NumberGeneratorProtocol.swift
//  PrimeAndFibonacciNumbers
//
//  Created by Роман Мироненко on 18.02.2021.
//

import Foundation
import BigInt

protocol NumberGeneratorProtocol: AnyObject {
    func generateNextNumbers(
        lastElement: BigInt?,
        limit: Int,
        responseBlock: @escaping Handler<[BigInt]>
    )
}
