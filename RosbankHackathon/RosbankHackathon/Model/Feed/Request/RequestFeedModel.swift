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
    let confirmedDeals: Int?
    let requestDescription: String
    let categories: [CategoryKind]!
    let achievements: [AchievementKind]!
    let rating: Int
    let ratingColor: String
    let companyAvatarURL: String

    // private

    var deadline: Date {
        return Date(timeIntervalSince1970: TimeInterval(unixTime))
    }

    private let unixTime: Int
}

extension RequestFeedModel: Decodable {
    enum CodingKeys: String, CodingKey {
        case name, rating

        case confirmedDeals, categories, achievements

        case ratingColor = "typeReyt"
        case unixTime = "date"
        case companyAvatarURL = "logo"
        case requestDescription = "zadania"
    }
}
