//
//  BaseTextField.swift
//  AccountBook
//
//  Created by 王馨妍 on 15/6/23.
//  Copyright (c) 2015年 wxy. All rights reserved.
//

import Foundation
import UIKit

class BaseTextField: UITextField {
    override func awakeFromNib() {
        self.tintColor = UIColor.grayColor()
    }
}