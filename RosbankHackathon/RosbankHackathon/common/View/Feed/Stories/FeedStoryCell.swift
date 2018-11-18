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
        layer.borderWidth = 4
        layer.borderColor = UIColor.blue.cgColor

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

        layer.cornerRadius = frame.height / 2
    }
}
