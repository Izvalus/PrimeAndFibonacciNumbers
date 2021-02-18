//
//  AnyHashableCollectionCellAdapter.swift
//  PrimeAndFibonacciNumbers
//
//  Created by Роман Мироненко on 18.02.2021.
//

import UIKit

final class AnyHashableCollectionCellAdapter: Hashable, CollectionCellAdapter {
    
    private let hashable: AnyHashable
    private let adapter: CollectionCellAdapter
    
    init<Model>(adapter: Model) where Model: CollectionCellAdapter, Model: Hashable {
        self.adapter = adapter
        self.hashable = AnyHashable(adapter)
    }
    
    init<Model>(
        adapter: Model,
        anyHashable: AnyHashable = AnyHashable(UUID())
    ) where Model: CollectionCellAdapter {
        self.adapter = adapter
        self.hashable = anyHashable
    }
    
    func collectionView(
        _ collectionView: UICollectionView,
        cellForItemAt indexPath: IndexPath
    ) -> UICollectionViewCell {
        adapter.collectionView(collectionView, cellForItemAt: indexPath)
    }
    
    static func == (lhs: AnyHashableCollectionCellAdapter, rhs: AnyHashableCollectionCellAdapter) -> Bool {
        lhs.hashable == rhs.hashable
    }
    func hash(into hasher: inout Hasher) {
        hasher.combine(hashable)
    }
}
