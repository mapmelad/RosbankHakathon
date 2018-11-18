//
//  Achievement.swift
//  RosbankHackathon
//
//  Created by Evgeniy on 18/11/2018.
//  Copyright © 2018 Semyon. All rights reserved.
//

import UIKit

enum AchievementKind {
    case dealer
    case king
    case lightning

    var icon: UIImage? {
        switch self {
        case .dealer:
            return UIImage(named: "hand-shake")
        case .king:
            return UIImage(named: "crowns")
        case .lightning:
            return UIImage(named: "light")
        }
    }
}

extension AchievementKind: Decodable {
    init(from decoder: Decoder) throws {
        throw AnyError()
    }
}
