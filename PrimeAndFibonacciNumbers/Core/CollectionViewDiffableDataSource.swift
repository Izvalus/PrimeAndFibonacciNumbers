//
//  TableDiffableDataSource.swift
//  PrimeAndFibonacciNumbers
//
//  Created by Роман Мироненко on 18.02.2021.
//

import UIKit

final class CollectionViewDiffableDataSource<SectionIdentifierType, ItemIdentifierType>: UICollectionViewDiffableDataSource<SectionIdentifierType, ItemIdentifierType> where SectionIdentifierType : Hashable, ItemIdentifierType : Hashable {
    
    var showLastCell: Action?
    
    @objc
    override func collectionView(
        _ collectionView: UICollectionView,
        cellForItemAt indexPath: IndexPath
    ) -> UICollectionViewCell {
        let result = snapshot()
        if indexPath.row == result.itemIdentifiers.count - 1 {
            showLastCell?()
        }
        return super.collectionView(collectionView, cellForItemAt: indexPath)
    }
}
