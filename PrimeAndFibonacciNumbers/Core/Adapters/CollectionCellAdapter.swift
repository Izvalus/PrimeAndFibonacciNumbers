//
//  CollectionCellAdapter.swift
//  PrimeAndFibonacciNumbers
//
//  Created by Роман Мироненко on 18.02.2021.
//

import UIKit

protocol CollectionCellAdapter {
    func collectionView(
        _ collectionView: UICollectionView,
        cellForItemAt indexPath: IndexPath
    ) -> UICollectionViewCell
}

extension CollectionCellAdapter where Self: Hashable {
    func toAnyHashableTableCellAdapter() -> AnyHashableCollectionCellAdapter {
        AnyHashableCollectionCellAdapter(adapter: self)
    }
}

