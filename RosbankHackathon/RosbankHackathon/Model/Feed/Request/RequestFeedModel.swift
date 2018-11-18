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
    let rating: Double!
    var deadline: Date {
        return Date(timeIntervalSince1970: TimeInterval(unixTime))
    }
    let companyAvatarURL: String

    // private

    private let unixTime: Int

    init(name: String, confirmedDeals: Int, requestDescription: String, categories: [CategoryKind], achievements: [AchievementKind], rating: Double) {
        self.name = name
        self.confirmedDeals = confirmedDeals
        self.requestDescription = requestDescription
        self.categories = categories
        self.achievements = achievements
        self.rating = rating
        self.companyAvatarURL = ""
        unixTime = 0
    }
}

extension RequestFeedModel: Decodable {
    enum CodingKeys: String, CodingKey {
        case name

        case confirmedDeals, categories, achievements, rating

        case unixTime = "date"
        case companyAvatarURL = "logo"
        case requestDescription = "zadania"
    }
}
