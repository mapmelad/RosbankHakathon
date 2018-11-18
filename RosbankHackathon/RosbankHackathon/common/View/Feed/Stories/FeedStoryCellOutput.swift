//
//  FeedStoryCellOutput.swift
//  RosbankHackathon
//
//  Created by Evgeniy on 18/11/2018.
//  Copyright © 2018 Semyon. All rights reserved.
//

import Foundation

protocol FeedStoryCellOutput: class {
    var onTap: VoidBlock? { get set }
}
