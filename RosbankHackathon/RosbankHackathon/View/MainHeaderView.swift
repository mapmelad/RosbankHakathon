//
//  MainHeaderView.swift
//  RosbankHackathon
//
//  Created by Semyon on 17/11/2018.
//  Copyright © 2018 Semyon. All rights reserved.
//

import UIKit

protocol HeaderViewOutput: class {
    var onTextEnetered: ( (String)->Void)? {get set}
}

protocol HeaderView: HeaderViewOutput {
    func setup(with title: String)
}

final class MainHeaderView: UIView, HeaderView {
    // Methods
    
    func setup(with title: String) {
        //titleLabel.text = title
    }
    
    // Output
    
    var onTextEnetered: ((String) -> Void)?
    
    // init
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        internalInit()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        internalInit()
        
    }
    
    func internalInit() {
        backgroundColor = .yellow
    }
}
