//
//  Date+fmt.swift
//  RosbankHackathon
//
//  Created by Evgeniy on 18/11/2018.
//  Copyright © 2018 Semyon. All rights reserved.
//

import Foundation

extension Date {
    var humanString: String {
        let delta = timeIntervalSinceNow
        let min: TimeInterval = 60
        let hour: TimeInterval = 3600
        let day: TimeInterval = 86400

        let fmt = DateFormatter()

        if delta < 0 {
            fmt.dateFormat = "до d MMM yyyy"
        } else if delta == 0 {
            fmt.dateFormat = "сейчас"
        } else if delta < 2 * day {
            let hourValue = Int(delta / hour)
            fmt.dateFormat = "\(hourValue) ч"
        } else {
            fmt.dateFormat = "до d MMM"
        }

        return fmt.string(from: self)
    }
}
