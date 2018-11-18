//
//  EPAPIClient.swift
//  RosbankHackathon
//
//  Created by Evgeniy on 18/11/2018.
//  Copyright © 2018 Semyon. All rights reserved.
//

import Foundation

final class EPAPIClient {
    // MARK: - Members

    private let provider: ResponseProvider

    // MARK: - Interface

    func get<M: Decodable>(method: EPAPIMethod, params: [QueryItem], completion: @escaping ModelBlock<M>) {
        provider.get(url: method.value, query: []) { (response: EPAPIResponse<M>) in
            completion(response.feed)
        }
    }

    func getArray<M: Decodable>(method: EPAPIMethod, params: [QueryItem], completion: @escaping ModelBlock<[M]>) {
        provider.get(url: method.value, query: []) { (response: EPAPIArrayResponse<M>) in
            completion(response.feed)
        }
    }

    // MARK: - Init

    init(provider: ResponseProvider) {
        self.provider = provider
    }
}
