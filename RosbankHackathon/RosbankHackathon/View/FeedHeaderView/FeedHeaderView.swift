//
//  FeedHeaderView.swift
//  RosbankHackathon
//
//  Created by Evgeniy on 17/11/2018.
//  Copyright © 2018 Evgeniy. All rights reserved.
//

import Foundation

protocol HeaderViewOutput: class {
    var onTextEnetered: ((String) -> Void)? { get set }
}

protocol HeaderView: HeaderViewOutput {
    func setup(with title: String)
}
