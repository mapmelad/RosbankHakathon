//
//  EPAPIResponse.swift
//  RosbankHackathon
//
//  Created by Evgeniy on 18/11/2018.
//  Copyright © 2018 Semyon. All rights reserved.
//

import Foundation

struct EPAPIArrayResponse<M: Decodable>: Decodable {
    let feed: [M]
}

struct EPAPIResponse<M: Decodable>: Decodable {
    let feed: M
}
