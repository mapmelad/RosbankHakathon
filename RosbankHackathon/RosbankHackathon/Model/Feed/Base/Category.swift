//
//  CategoryKind.swift
//  RosbankHackathon
//
//  Created by Evgeniy on 18/11/2018.
//  Copyright © 2018 Semyon. All rights reserved.
//

import Foundation

enum CategoryKind {
    case none

    var stringValue: String {
        switch self {
        case .none:
            return "none"
        }
    }
}
