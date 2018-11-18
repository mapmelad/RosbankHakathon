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
    let ratingColor: UIColor
    let deadline: String
}

extension RequestFeedViewModel {
    init(model: RequestFeedModel) {
        let randomNum = Int(arc4random_uniform(11))

        name = model.name
        requestDescription = model.requestDescription
        achievements = RequestFeedViewModel.randomAchievements().compactMap { $0.icon }
        categories = "" // model.categories.map { $0.stringValue }.joined(separator: ",")
        deadline = model.deadline.humanString
        rating = "\(model.rating).\(randomNum)"

        if model.ratingColor == "yellow" {
            ratingColor = #colorLiteral(red: 0.987544477, green: 0.6673021317, blue: 0, alpha: 1)
        } else if model.ratingColor == "green" {
            ratingColor = #colorLiteral(red: 0.2222073078, green: 0.6842822433, blue: 0.3299767971, alpha: 1)
        } else {
            ratingColor = #colorLiteral(red: 0.8886404634, green: 0.3087466955, blue: 0.2089650035, alpha: 1)
        }
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
