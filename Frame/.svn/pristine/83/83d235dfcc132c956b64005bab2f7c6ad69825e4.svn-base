//
//  UIColorExtension.swift
//  SwiftFrame
//
//  Created by iOSDeveloper on 2016/10/26.
//  Copyright © 2016年 iOSDeveloper. All rights reserved.
//

import Foundation
import UIKit

extension UIColor{
    class func HEXColor(color: uint) -> UIColor {
        let r = CGFloat((color&0xFF0000) >> 16)
        let g = CGFloat((color&0xFF00) >> 8)
        let b = CGFloat((color&0xFF))
        return UIColor(red:r/255, green: g/255, blue: b/255, alpha: 1)
    }
}
