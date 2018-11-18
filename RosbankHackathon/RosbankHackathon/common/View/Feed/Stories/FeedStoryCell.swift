//
//  FeedStoryCell.swift
//  RosbankHackathon
//
//  Created by Evgeniy on 17/11/2018.
//  Copyright © 2018 Semyon. All rights reserved.
//

import UIKit

final class FeedStoryCell: UICollectionViewCell, FeedStoryCellOutput {
    // MARK: - Output

    var onTap: VoidBlock?

    // MARK: - Views

    private let iconView: UIImageView = {
        let imageView = UIImageView()
        imageView.clipsToBounds = true
        imageView.backgroundColor = #colorLiteral(red: 0.2389388382, green: 0.5892125368, blue: 0.8818323016, alpha: 1)

        return imageView
    }()

    // MARK: - Interface

    func setup(with model: UIImage) {
        iconView.image = model
    }

    // MARK: - Init

    override init(frame: CGRect) {
        super.init(frame: frame)
        internalInit()
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        internalInit()
    }

    private func internalInit() {
        addSubview(iconView)

        iconView.layer.borderWidth = 4
        iconView.layer.borderColor = UIColor.blue.cgColor

        let tap = UITapGestureRecognizer(target: self, action: #selector(handleTap))
        contentView.addGestureRecognizer(tap)
    }

    // MARK: - Actions

    @objc
    private func handleTap() {
        onTap?()
    }

    // MARK: - Layout

    override func layoutSubviews() {
        super.layoutSubviews()

        iconView.pin.all()
        iconView.layer.cornerRadius = iconView.frame.height / 2
    }
}
