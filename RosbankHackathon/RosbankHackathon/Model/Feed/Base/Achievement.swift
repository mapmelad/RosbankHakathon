//
//  Achievement.swift
//  RosbankHackathon
//
//  Created by Evgeniy on 18/11/2018.
//  Copyright © 2018 Semyon. All rights reserved.
//

import UIKit

enum AchievementKind {
    case none

    var icon: UIImage? {
        switch self {
        case .none:
            return nil
        }
    }
}
