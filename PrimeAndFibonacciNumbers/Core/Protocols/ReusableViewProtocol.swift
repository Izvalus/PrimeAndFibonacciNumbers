//
//  ReusableView.swift
//  PrimeAndFibonacciNumbers
//
//  Created by Роман Мироненко on 18.02.2021.
//

import Foundation

protocol ReusableViewProtocol: AnyObject {
    static var defaultReuseIdentifier: String { get }
}
