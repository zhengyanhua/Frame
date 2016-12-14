//
//  BaseTabBarController.swift
//  SwiftFrame
//
//  Created by iOSDeveloper on 2016/10/20.
//  Copyright © 2016年 iOSDeveloper. All rights reserved.
//

import UIKit

class BaseTabBarController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    func addChildViewContrller(childViewController : UIViewController , title : String , imageName : String)  {
        childViewController.title = title
        addChildViewController(UINavigationController.init(rootViewController:childViewController ))
        
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