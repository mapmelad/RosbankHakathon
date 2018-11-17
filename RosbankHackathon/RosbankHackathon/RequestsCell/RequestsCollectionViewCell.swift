//
//  RequestsCollectionViewCell.swift
//  RosbankHackathon
//
//  Created by Semyon on 17/11/2018.
//  Copyright © 2018 Semyon. All rights reserved.
//

import UIKit

class RequestsCollectionViewCell: UICollectionViewCell {

    @IBOutlet var imageView: UIView!
    @IBOutlet var dealsImage: UIImageView!
    @IBOutlet var timeImage: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        timeImage.tintColor = UIColor.hex(0x434343)
        dealsImage.tintColor = UIColor.hex(0x434343)
        imageView.backgroundColor = UIColor.hex(0xE2751B)
        imageView.layer.cornerRadius = 21
    }

}
