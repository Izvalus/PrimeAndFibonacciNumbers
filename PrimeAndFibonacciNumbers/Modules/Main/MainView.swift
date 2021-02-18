//
//  PrimeNumberView.swift
//  PrimeAndFibonacciNumbers
//
//  Created by Роман Мироненко on 18.02.2021.
//

import UIKit

extension MainViewController {
    final class View: UIView {
        lazy var collectionView = setup(
            UICollectionView(
                frame: .zero,
                collectionViewLayout: compositionalLayout()
            )
        ) {
            $0.register(registerClass: NumberCell.self)
            $0.backgroundColor = .lightGray
        }
        
        init() {
            super.init(frame: .zero)
            addSubview(collectionView)
            setupConstraints()
        }
        
        required init?(coder: NSCoder) {
            fatalError("init(coder:) has not been implemented")
        }
        
        private func compositionalLayout() -> UICollectionViewLayout {
            
            let config = UICollectionViewCompositionalLayoutConfiguration()
            let group = NSCollectionLayoutGroup.horizontal(
                layoutSize: NSCollectionLayoutSize(
                    widthDimension: .fractionalWidth(1.0),
                    heightDimension: .absolute(70)
                ),
                subitem: NSCollectionLayoutItem(
                    layoutSize: .init(
                        widthDimension: .fractionalWidth(1.0),
                        heightDimension: .fractionalHeight(1.0)
                    )
                ),
                count: 2
            )
            group.interItemSpacing = .fixed(16)
            let section = NSCollectionLayoutSection(group: group)
            section.interGroupSpacing = 16
            section.contentInsets = .init(top: 16, leading: 16, bottom: 16, trailing: 16)
            let layout = UICollectionViewCompositionalLayout(
                section: section,
                configuration: config
            )
            return layout
        }
        
        private func setupConstraints() {
            collectionView.snp.makeConstraints { make in
                make.edges.equalToSuperview()
            }
        }
        
    }
}
