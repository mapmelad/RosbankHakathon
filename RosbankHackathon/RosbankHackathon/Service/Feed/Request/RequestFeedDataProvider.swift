//
//  RequestFeedDataProvider.swift
//  RosbankHackathon
//
//  Created by Evgeniy on 18/11/2018.
//  Copyright © 2018 Semyon. All rights reserved.
//

import UIKit

protocol RequestFeedDataProvider: class {
    func get() -> [RequestFeedViewModel]
}

final class RequestFeedDataProviderImp: RequestFeedDataProvider {
    // MARK: - Interface

    func get() -> [RequestFeedViewModel] {
        let items = [RequestFeedModel(name: "Some name",
                                      confirmedDeals: 44,
                                      requestDescription: "description",
                                      categories: [.none],
                                      achievements: [.dealer],
                                      rating: 1.2,
                                      deadline: Date()),

                     RequestFeedModel(name: "Some name",
                                      confirmedDeals: 44,
                                      requestDescription: "description",
                                      categories: [.none],
                                      achievements: [.dealer, .lightning],
                                      rating: 1.2,
                                      deadline: Date())]

        return items.map { RequestFeedViewModel(model: $0) }
    }
}

private extension RequestFeedViewModel {
    init(model: RequestFeedModel) {
        name = model.name
        requestDescription = model.requestDescription
        achievements = model.achievements.compactMap { $0.icon }
        categories = model.categories.map { $0.stringValue }.joined(separator: ",")
        deadline = model.deadline.humanString
        rating = "\(model.rating)"
    }
}
