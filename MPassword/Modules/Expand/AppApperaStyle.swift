//
//  AppApperaStyle.swift
//  MPassword
//
//  Created by kris on 2018/1/16.
//  Copyright © 2018年 kris'Liu. All rights reserved.
//

import Foundation

extension UIColor{
    var themeColor:UIColor{
        return UIColor.red
    }
    
    public func hexStringToColor(hexString: String) -> UIColor{

        var cString = hexString.trimmingCharacters(in: CharacterSet.whitespacesAndNewlines).uppercased()
        if cString.hasPrefix("#"){
            
            let index   = cString.index(cString.startIndex, offsetBy: 1)
            cString     = String(cString.prefix(upTo: index))
        }
        if cString.count != 6 {
            return UIColor.red
        }
        
        let rIndex      = cString.index(cString.startIndex, offsetBy: 2)
        let rString     = cString.prefix(upTo: rIndex)
        
        let otherString = cString.suffix(from: rIndex)
        let gIndex      = otherString.index(otherString.startIndex, offsetBy: 2)
        let gString     = otherString.prefix(upTo: gIndex)
        let bIndex      = cString.index(cString.endIndex, offsetBy: -2)
        let bString     = cString.suffix(from: bIndex)
        
        var r:CUnsignedInt  = 0,g:CUnsignedInt = 0 ,b:CUnsignedInt = 0
        Scanner(string: String(rString)).scanHexInt32(&r)
        Scanner(string: String(gString)).scanHexInt32(&g)
        Scanner(string: String(bString)).scanHexInt32(&b)
        return UIColor(red: CGFloat(r)/255.0, green: CGFloat(g)/255.0, blue: CGFloat(b)/255.0, alpha: CGFloat(1))
        
    }
}
