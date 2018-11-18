//
//  FeedFilterOptionCell.swift
//  RosbankHackathon
//
//  Created by Evgeniy on 18/11/2018.
//  Copyright © 2018 Semyon. All rights reserved.
//

import UIKit

final class FeedFilterOptionCell: UITableViewCell {
    // MARK: - Outlets

    @IBOutlet
    private var titleLabel: UILabel!

    @IBOutlet
    private var optionSwitch: UISwitch!

    // MARK: - Setup

    func setup(with model: String) {
        titleLabel.text = model
    }
}
