//
//  UICollectionVIew+Extensions.swift
//  RosbankHackathon
//
//  Created by Evgeniy on 17/11/2018.
//  Copyright © 2018 Evgeniy. All rights reserved.
//

import UIKit
extension UICollectionView {
    var flowLayout: UICollectionViewFlowLayout? {
        return collectionViewLayout as? UICollectionViewFlowLayout
    }
}

extension UICollectionView {
    convenience init(scrollDirection: UICollectionView.ScrollDirection) {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = scrollDirection
        layout.itemSize = CGSize(width: 100, height: 100)
        self.init(frame: .zero, collectionViewLayout: layout)
    }
}
