//
//  EPAPIMethod.swift
//  RosbankHackathon
//
//  Created by Evgeniy on 18/11/2018.
//  Copyright © 2018 Semyon. All rights reserved.
//

import Foundation

enum EPAPIMethod: URLAdaptable {
    case requestsGet
}

extension EPAPIMethod {
    var value: String {
        switch self {
        case .requestsGet:
            return "getFeed"
        }
    }
}
