//
//  RequestsCollectionViewCell.swift
//  RosbankHackathon
//
//  Created by Semyon on 17/11/2018.
//  Copyright © 2018 Semyon. All rights reserved.
//

import UIKit

final class RequestsCollectionViewCell: UICollectionViewCell {
    // MARK: - Outlets

    @IBOutlet
    private var nameLabel: UILabel!

    @IBOutlet
    private var descriptionLabel: UILabel!

    @IBOutlet
    private var categoryView: UIView!

    @IBOutlet
    private var categoryImageView: UIImageView!

    @IBOutlet
    private var firstImageView: UIImageView!

    @IBOutlet
    private var middleImageView: UIImageView!

    @IBOutlet
    private var lastImageView: UIImageView!

    @IBOutlet
    private var timeImage: UIImageView!

    @IBOutlet
    private var deadlineLabel: UILabel!

    // MARK: - Setup

    override func awakeFromNib() {
        super.awakeFromNib()

        timeImage.tintColor = UIColor.hex(0x434343)
        lastImageView.tintColor = UIColor.hex(0x434343)
        categoryImageView.backgroundColor = UIColor.hex(0xE2751B)
        categoryImageView.layer.cornerRadius = 21
    }

    func setup(with model: RequestFeedViewModel) {
        nameLabel.text = model.name

        for (idx, iv) in [lastImageView, middleImageView, firstImageView].enumerated() {
            let image = model.achievements.item(at: idx)
            iv?.image = image
        }

        descriptionLabel.text = model.requestDescription
        deadlineLabel.text = model.deadline
    }

    override var intrinsicContentSize: CGSize {
        let height: CGFloat = 65 + descriptionLabel.intrinsicContentSize.height

        return CGSize.init(width: -1, height: height)
    }
}
