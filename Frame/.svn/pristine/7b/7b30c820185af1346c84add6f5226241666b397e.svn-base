//
//  BaseNavigationController.swift
//  SwiftFrame
//
//  Created by iOSDeveloper on 2016/10/27.
//  Copyright © 2016年 iOSDeveloper. All rights reserved.
//

import UIKit

class BaseNavigationController: UINavigationController,UIGestureRecognizerDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.interactivePopGestureRecognizer?.delegate = self
        // self.interactivePopGestureRecognizer?.delegate = nil 和上面一样的效果
        // Do any additional setup after loading the view.
    }
    func gestureRecognizerShouldBegin(_ gestureRecognizer: UIGestureRecognizer) -> Bool {
//        if childViewControllers.count == 1 {
//            return false
//        }
//        return true
        return childViewControllers.count != 1
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
