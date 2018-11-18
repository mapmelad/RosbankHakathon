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
        let items: [RequestFeedModel] = []

        return items.map { RequestFeedViewModel(model: $0) }
    }
}
