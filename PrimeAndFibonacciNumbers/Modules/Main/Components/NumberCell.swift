//
//  PrimeNumberCell.swift
//  PrimeAndFibonacciNumbers
//
//  Created by Роман Мироненко on 18.02.2021.
//

import UIKit

extension MainViewController {
    final class NumberCell: UICollectionViewCell {
        
        let numberLabel = setup(UILabel()) {
            $0.textAlignment = .center
            $0.font = .boldSystemFont(ofSize: 16)
            $0.numberOfLines = 0
            $0.adjustsFontSizeToFitWidth = true
        }
        
        override init(frame: CGRect) {
            super.init(frame: .zero)
            contentView.addSubview(numberLabel)
            layer.cornerRadius = 10
            setupContsraints()
        }
        
        required init?(coder: NSCoder) {
            fatalError("init(coder:) has not been implemented")
        }
        
        private func setupContsraints() {
            numberLabel.snp.makeConstraints {
                $0.center.equalToSuperview()
                $0.trailing.leading.equalToSuperview().inset(5)
                $0.bottom.top.equalToSuperview().inset(5)
            }
        }
    }
}
