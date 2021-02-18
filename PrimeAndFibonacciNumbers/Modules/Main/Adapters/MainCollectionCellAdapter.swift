//
//  MainCollectionCellAdapter.swift
//  PrimeAndFibonacciNumbers
//
//  Created by Роман Мироненко on 18.02.2021.
//

import UIKit

struct MainCollectionCellAdapter: Hashable {
    let uuid = UUID()
    let value: String
}

extension MainCollectionCellAdapter: CollectionCellAdapter {
    func collectionView(
        _ collectionView: UICollectionView,
        cellForItemAt indexPath: IndexPath
    ) -> UICollectionViewCell {
        let cell: MainViewController.NumberCell = collectionView.dequeueReusableCell(forIndexPath: indexPath)
        cell.numberLabel.text = value
        if indexPath.item % 4 == 1 ||
            indexPath.item % 4 == 2 {
            cell.backgroundColor = .systemYellow
        } else {
            cell.backgroundColor = .systemOrange
        }
        return cell
    }
}
