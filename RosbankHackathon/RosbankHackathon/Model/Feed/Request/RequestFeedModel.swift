//
//  RequestFeedModel.swift
//  RosbankHackathon
//
//  Created by Evgeniy on 18/11/2018.
//  Copyright © 2018 Semyon. All rights reserved.
//

import Foundation

struct RequestFeedModel {
    let name: String
    let confirmedDeals: Int
    let requestDescription: String
    let categories: [CategoryKind]
    let achievements: [AchievementKind]
    let rating: Double
    let deadline: Date
}
