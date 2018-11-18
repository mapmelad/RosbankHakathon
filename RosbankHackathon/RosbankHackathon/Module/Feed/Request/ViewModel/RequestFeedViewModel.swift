//
//  RequestFeedViewModel.swift
//  RosbankHackathon
//
//  Created by Evgeniy on 18/11/2018.
//  Copyright © 2018 Semyon. All rights reserved.
//

import UIKit

struct RequestFeedViewModel {
    let name: String
    let requestDescription: String
    let achievements: [UIImage]
    let categories: String
    let rating: String
    let deadline: String
}

extension RequestFeedViewModel {
    init(model: RequestFeedModel) {
        name = model.name
        requestDescription = model.requestDescription
        achievements = RequestFeedViewModel.randomAchievements().compactMap { $0.icon }
        categories = ""//model.categories.map { $0.stringValue }.joined(separator: ",")
        deadline = model.deadline.humanString
        rating = "\(model.rating)"
    }

    private static func randomAchievements() -> [AchievementKind] {
        let num = Int(arc4random_uniform(4))
        let all: [AchievementKind] = [.dealer, AchievementKind.king, AchievementKind.lightning]

        var result = [AchievementKind]()

        for idx in 0 ..< num {
            result.append(all[idx])
        }

        return result
    }
}
