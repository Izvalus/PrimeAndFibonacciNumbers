//
//  UICollectionViewCell+Extensions.swift
//  PrimeAndFibonacciNumbers
//
//  Created by Роман Мироненко on 18.02.2021.
//

import UIKit

extension UICollectionViewCell: ReusableViewProtocol {
    static var defaultReuseIdentifier: String {
        return String(describing: self)
    }
}
