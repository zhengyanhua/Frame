//
//  UIBarButtonItemExtension.swift
//  SwiftFrame
//
//  Created by iOSDeveloper on 2016/10/26.
//  Copyright © 2016年 iOSDeveloper. All rights reserved.
//

import Foundation
import UIKit

let btnTitleFont: CGFloat = 15
let btnTitleColor: UIColor = UIColor.gray


extension UIBarButtonItem {
    // 便利构造函数 self.init()
    // MARK: - 便利构造函数
    convenience init(imageName : String? = nil,title : String? = nil,target: Any?, action: Selector) {
        self.init()
        let button = UIButton()
        button.addTarget(target, action: action, for: .touchUpInside)
        if let a = imageName {
            button.setImage(UIImage(named:a), for: .normal)
        }
        if let  b = title {
            button.setTitle(b, for: .normal)
            button.titleLabel?.font = UIFont.systemFont(ofSize: btnTitleFont)
            button.setTitleColor(btnTitleColor, for: .normal)
        }
        button.sizeToFit()
        customView = button
    }
}
