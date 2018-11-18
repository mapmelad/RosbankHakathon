//
//  FeedHeaderView.swift
//  RosbankHackathon
//
//  Created by Evgeniy on 17/11/2018.
//  Copyright © 2018 Evgeniy. All rights reserved.
//

import UIKit

protocol HeaderViewOutput: class {
    var onTextEnetered: ((String) -> Void)? { get set }
    var onStoryTap: VoidBlock? { get set }
}

protocol HeaderView: HeaderViewOutput {
    func setup(with title: String, collectionViewDataProvider: (CollectionViewDataProvider & FeedStoryCellOutput))

    var generalizeSearchView: UIView? { get set }
}
