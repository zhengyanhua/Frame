//
//  SwiftCommUtil.swift
//  SwiftFrame
//
//  Created by iOSDeveloper on 2016/11/3.
//  Copyright © 2016年 iOSDeveloper. All rights reserved.
//

import UIKit

class SwiftCommUtil: NSObject {
    
    class func saveData(dic : Any , fileName : String) {
        let archiverData = NSKeyedArchiver.archivedData(withRootObject: dic)
        let userDefautls = UserDefaults.standard
        userDefautls.set(archiverData, forKey: fileName)
        userDefautls.synchronize()
    }
    // MARK: - 读取存储数据
    class func readData(fileName : String) -> Any? {
        let userDefautls = UserDefaults.standard
        let archiveData  = userDefautls.object(forKey: fileName)
        if archiveData == nil {
            return nil
        }
        if let a = archiveData as? Data{
            let readData = NSKeyedUnarchiver.unarchiveObject(with: a)
            return readData
        }
        return nil
    }
    // MARK: - 读取普通数据
    class func readId(fileName : String) -> Any? {
        let userDefautls = UserDefaults.standard
        return userDefautls.object(forKey: fileName)
    }
    // MARK: - 删除数据
    class func deleteDate(fileName : String) {
        let userDefautls = UserDefaults.standard
        userDefautls.removeObject(forKey: fileName)
        userDefautls.synchronize()
    }
    // MARK: - 存储到NSUserDefaults数据
    class func saveUserDefaults(object : AnyObject , userDefaultName : String) {
        let userDefautls = UserDefaults.standard
        userDefautls.set(object, forKey: userDefaultName)
        userDefautls.synchronize()
    }
    // MARK: - 删除NSUserDefaults数据
    class func deleteUserDefaultsData(userDefaultName : String){
        SwiftCommUtil.deleteDate(fileName: userDefaultName)
    }
}
