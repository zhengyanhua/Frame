//
//  NetWorkManager.swift
//  SwiftFrame
//
//  Created by iOSDeveloper on 2016/10/25.
//  Copyright © 2016年 iOSDeveloper. All rights reserved.
//

import UIKit
import AFNetworking
import JSONKit

enum HttpRequestMethod : Int {
    case HttpRequestMethodGET
    case HttpRequestMethodPOST
}
typealias successBlock = (_ urlSessionDataTask:URLSessionDataTask,_ response:AnyObject) -> Void
typealias failureBlock = (_ urlSessionDataTask:URLSessionDataTask? ,_ error:Error) -> Void
class NetWorkManager: NSObject {
    static let shareNetWork = NetWorkManager()
    lazy var httpSessionManager :  AFHTTPSessionManager = {
        let manager = AFHTTPSessionManager()
        manager.responseSerializer = AFJSONResponseSerializer()
        manager.requestSerializer = AFJSONRequestSerializer()
        manager.securityPolicy.allowInvalidCertificates = true
        manager.requestSerializer.timeoutInterval = 30
        return manager
    }()
    func requestOperation(requestUrl:String,paramDic:NSDictionary ,headerFieldParamsDic:NSDictionary,httpRequestMethod:HttpRequestMethod,successData:@escaping successBlock,failureData :@escaping failureBlock)  {
        for key in headerFieldParamsDic.allKeys {
            self.httpSessionManager.requestSerializer.setValue(headerFieldParamsDic.object(forKey: key)as? String, forHTTPHeaderField:key as! String)
        }
        if httpRequestMethod == HttpRequestMethod.HttpRequestMethodPOST {
             self.httpSessionManager.post(requestUrl, parameters: paramDic, progress: { (progress) in
                }, success: { (task, responseObject) in
                    if let a = responseObject {
                        successData(task,a as AnyObject )
                    }
                }, failure: { (task, error) in
                    failureData(task, error)
             })
        }else if httpRequestMethod == HttpRequestMethod.HttpRequestMethodGET {
            httpSessionManager.get(requestUrl, parameters: paramDic, progress: { (progress) in
                
                }, success: { (task, responseObject) in
                    if let a = responseObject {
                        successData(task,a as AnyObject )
                    }
                }, failure: { (task, error) in
                    failureData(task, error)
            })
            
        }
    }
    func loginOperation(dataDic: NSDictionary,success:@escaping successBlock,failure:@escaping failureBlock) {
        let paramDic:NSMutableDictionary = self.dataDicAndRequestCode(dic: dataDic, requestCode: "0100", netWorkType: 1)
        let headerDic:NSDictionary = NSDictionary()
        self.requestOperation(requestUrl: "http://www.suny123.com/suny/pjhsAppDataInteractionServlet", paramDic: paramDic, headerFieldParamsDic: headerDic, httpRequestMethod: HttpRequestMethod.HttpRequestMethodPOST, successData: success, failureData: failure)
        
    }
    func dataDicAndRequestCode(dic:NSDictionary,requestCode:String,netWorkType:Int) -> NSMutableDictionary {
        let parmDic:NSMutableDictionary = NSMutableDictionary()
        if (netWorkType == 1) {
            parmDic.setObject(requestCode, forKey: "flag" as NSCopying)
            parmDic.setObject(dic, forKey:"data" as NSCopying)
        } else {
            parmDic.setObject(requestCode, forKey: "requestCode" as NSCopying)
            parmDic.setObject(dic.jsonString(), forKey:"data" as NSCopying)
        }
        return parmDic
    }
    func startNetQueue()  {
        let arr = SwiftCommUtil.readData(fileName: "NetQueue") as? [OperationModel]
        var array : [OperationModel]  = [OperationModel]()
        if let a = arr {
            for item in a {
                if item.uploadStatus == uploadStatus.statusFailed {
                    array.append(item)
                }
            }
            TaskOperationManager.shared().addTaskModels(array)
            for model  in TaskOperationManager.shared().taskModels {
                if let a = model as? OperationModel {
                    TaskOperationManager.shared().startUpload(withTaskModel: a)
                }
            }
        }
    }
}
