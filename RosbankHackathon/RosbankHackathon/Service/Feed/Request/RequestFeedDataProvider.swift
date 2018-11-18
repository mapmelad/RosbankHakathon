//
//  RequestFeedDataProvider.swift
//  RosbankHackathon
//
//  Created by Evgeniy on 18/11/2018.
//  Copyright © 2018 Semyon. All rights reserved.
//

import Foundation

protocol RequestFeedDataProvider: class {
    func get() -> [RequestFeedViewModel]
}

final class RequestFeedDataProviderImp: RequestFeedDataProvider {
    // MARK: - Interface

    func get() -> [RequestFeedViewModel] {
        let items = [RequestFeedViewModel(name: "Some name",
                                          requestDescription: "some descr",
                                          achievements: [],
                                          categories: "dasda",
                                          deadline: "25 nov.")]

        return items
    }
}
