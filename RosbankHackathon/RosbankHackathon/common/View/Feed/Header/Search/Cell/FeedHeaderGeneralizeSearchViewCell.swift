//
//  FeedHeaderGeneralizeSearchViewCell.swift
//  RosbankHackathon
//
//  Created by Evgeniy on 18/11/2018.
//  Copyright © 2018 Semyon. All rights reserved.
//

import UIKit

final class FeedHeaderGeneralizeSearchViewCell: UICollectionViewCell {
    // MARK: - Outlets

    private let titleLabel: UILabel = {
        let label = UILabel()
        label.text = "Уточнить поиск"
        label.font = UIFont.systemFont(ofSize: 16, weight: .medium)
        label.textColor = #colorLiteral(red: 0.926155746, green: 0.9410773516, blue: 0.9455420375, alpha: 1)

        return label
    }()

    // MARK: - Interface

    func setup(with model: String) {
        titleLabel.text = model
    }

    // MARK: - Setup

    override init(frame: CGRect) {
        super.init(frame: frame)
        internalInit()
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        internalInit()
    }

    private func internalInit() {
        [titleLabel].forEach(contentView.addSubview)
        layer.cornerRadius = 4
    }

    // MARK: - Layout

    override func layoutSubviews() {
        super.layoutSubviews()

        titleLabel.pin.center().sizeToFit()
        contentView.pin.width(titleLabel.frame.width)
    }
}
