//
//  AppDelegate.swift
//  SwiftFrame
//
//  Created by iOSDeveloper on 2016/10/20.
//  Copyright © 2016年 iOSDeveloper. All rights reserved.
//

import UIKit
import AFNetworking

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        setIFly()
        reachability()
        appStyle()
        jSPatch()
        self.window?.rootViewController = UINavigationController(rootViewController: FirstViewController())
        self.window?.makeKeyAndVisible()
        return true
    }
    func appStyle()  {
        //  在general 勾选了hide status bar 隐藏了状态栏，启动后显示状态栏
        UIApplication.shared.isStatusBarHidden = false
        //  设置info.plist文件中View controller-based status bar appearance设为NO才起作用
        UIApplication.shared.statusBarStyle = UIStatusBarStyle.lightContent
        
        UINavigationBar.appearance().titleTextAttributes = [NSForegroundColorAttributeName : UIColor.black , NSFontAttributeName : UIFont.systemFont(ofSize: 18)]
        UINavigationBar.appearance().tintColor = UIColor.HEXColor(color: 0x20c6c6)
        UITabBarItem.appearance().setTitleTextAttributes([NSForegroundColorAttributeName : UIColor.HEXColor(color: 0x20c6c6)], for: UIControlState.selected)
        
    }
    func setIFly() {
        //创建语音配置,appid必须要传入，仅执行一次则可
        let initString = "appid=" + "57fb3345"
        //所有服务启动前，需要确保执行createUtility
        IFlySpeechUtility.createUtility(initString)
    }
    // 检查网络状态
    func reachability() {
        let mgr : AFNetworkReachabilityManager = AFNetworkReachabilityManager.shared()
        mgr.setReachabilityStatusChange { (status) in
            switch  status {
            case AFNetworkReachabilityStatus.unknown: // 未知网络
                print("未知网络")
                NetWorkManager.shareNetWork.startNetQueue()
            case AFNetworkReachabilityStatus.notReachable: // 没有网络(断网)
                print("没有网络(断网)");
            case AFNetworkReachabilityStatus.reachableViaWWAN: // 手机自带网络
                print("手机自带网络");
                NetWorkManager.shareNetWork.startNetQueue()
                
            case AFNetworkReachabilityStatus.reachableViaWiFi: // WIFI
                print("WIFI");
                NetWorkManager.shareNetWork.startNetQueue()
                //            default:
                //                break
            }
        }
        mgr.startMonitoring()
    }
    
    // 热修复代码
    func jSPatch()  {
//        let aClass: AnyClass? = NSClassFromString("SwiftDemo.ViewController")
//        if (aClass != nil) {
//            let clsName = NSStringFromClass(aClass!)
//            print(clsName)
//        } else {
//            print("error ViewController not found")
//        }
//        
//        let bClass: AnyClass? = NSClassFromString("SwiftDemo.TestObject")
//        if (bClass != nil) {
//            let clsName = NSStringFromClass(bClass!)
//            print(clsName)
//        } else {
//            print("error TestObject not found")
//        }
        
        let path = Bundle.main.path(forResource: "demo", ofType: "js")
        do {
            if let a = path {
                let patch = try String(contentsOfFile: a)
                
                JPEngine.start()
                JPEngine.evaluateScript(patch)
            }
        } catch {}
    }
    func applicationWillResignActive(_ application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
    }

    func applicationDidEnterBackground(_ application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }

    func applicationWillEnterForeground(_ application: UIApplication) {
        // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
    }

    func applicationDidBecomeActive(_ application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }

    func applicationWillTerminate(_ application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }


}

