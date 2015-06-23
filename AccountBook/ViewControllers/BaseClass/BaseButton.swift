//
//  BaseButton.swift
//  AccountBook
//
//  Created by 王馨妍 on 15/6/23.
//  Copyright (c) 2015年 wxy. All rights reserved.
//

import Foundation
import UIKit

class BaseButton: UIButton {
    override func awakeFromNib() {
        self.titleLabel?.font = UIFont(name: "DFPWaWaW5", size: 17)
    
    }
}