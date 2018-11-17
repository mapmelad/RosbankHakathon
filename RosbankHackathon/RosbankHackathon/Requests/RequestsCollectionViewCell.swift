//
//  RequestsCollectionViewCell.swift
//  RosbankHackathon
//
//  Created by Semyon on 17/11/2018.
//  Copyright © 2018 Semyon. All rights reserved.
//

import UIKit

class RequestsCollectionViewCell: UICollectionViewCell {

    @IBOutlet var dealsImage: UIImageView!
    @IBOutlet var timeImage: NSLayoutConstraint!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        dealsImage.tintColor = UIColor.hex(0x999999)
    }

}
