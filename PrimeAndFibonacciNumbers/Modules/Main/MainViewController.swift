//
//  PrimeNumbersViewController.swift
//  PrimeAndFibonacciNumbers
//
//  Created by Роман Мироненко on 18.02.2021.
//

import UIKit
import BigInt

final class MainViewController: BaseViewController<MainViewController.View> {
    
    private lazy var collectionDataSource = CollectionViewDiffableDataSource<Int, AnyHashableCollectionCellAdapter>(
        collectionView: customView.collectionView)
    { (collectionView, indexPath, item) -> UICollectionViewCell? in
        item.collectionView(collectionView, cellForItemAt: indexPath)
    }
    
    private let _title: String
    
    private let viewModel: MainViewModel
    
    init(
        viewModel: MainViewModel,
        title: String
    ) {
        self.viewModel = viewModel
        self._title = title
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = _title
        customView.collectionView.dataSource = collectionDataSource
        viewModel.loadNextPage()
        collectionDataSource.showLastCell = { [weak viewModel] in
            viewModel?.loadNextPage()
        }
    }
}

extension MainViewController: MainViewModelDelegate {
    func appendNew(items: [String]) {
        var snapshot = collectionDataSource.snapshot()
        if snapshot.numberOfSections == 0 {
            snapshot.appendSections([0])
        }
        snapshot.appendItems(
            items.map{ MainCollectionCellAdapter(value: $0).toAnyHashableTableCellAdapter() }
        )
        collectionDataSource.apply(snapshot, animatingDifferences: true)
    }
}
