//
//  PasswordModel.swift
//  MPassword
//
//  Created by kris on 2018/1/16.
//  Copyright © 2018年 kris'Liu. All rights reserved.
//

import UIKit

enum PasswordType {
    case none
    case mail
}

class PasswordModel: NSObject {
    var userName:String?
    var passWord:String?
    var title:String?
    var type:PasswordType = PasswordType.none
}
