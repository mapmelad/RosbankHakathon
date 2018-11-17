//
//  UIView+Extension.swift
//  RosbankHackathon
//
//  Created by Evgeniy on 17/11/2018.
//  Copyright © 2018 Evgeniy. All rights reserved.
//

import UIKit

public extension UIView {
    public func addSubviews(_ subviews: [UIView]) {
        subviews.forEach(addSubview)
    }

    public func addSubviews(_ subviews: UIView...) {
        addSubviews(subviews)
    }
}
