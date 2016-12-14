//
//  BaseViewController.swift
//  SwiftFrame
//
//  Created by iOSDeveloper on 2016/10/20.
//  Copyright © 2016年 iOSDeveloper. All rights reserved.
//

import UIKit

class BaseViewController: UIViewController ,IFlySpeechRecognizerDelegate,IFlyRecognizerViewDelegate {
    /// 距离屏幕顶部的距离
    var viewTop : CGFloat = 0
    /// 距离屏幕顶部的高度
    var frameTopHeight : CGFloat = 0

    /// 语音识别
    var iflyRecognizerView : IFlyRecognizerView?
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.clear
        if self.navigationController != nil {
            frameTopHeight = 64
            viewTop = 0
        }else{
            frameTopHeight = 20
            viewTop = 20
        }
        if iflyRecognizerView == nil{
            initRecognizer()
        }
        iflyRecognizerView?.setParameter("1", forKey: "audio_source")
        iflyRecognizerView?.setParameter("plain", forKey: IFlySpeechConstant.result_TYPE())
        iflyRecognizerView?.setParameter("asr.pcm", forKey: IFlySpeechConstant.asr_PTT_NODOT())
        // Do any additional setup after loading the view.
    }
    func initRecognizer() {
        if iflyRecognizerView == nil {
            iflyRecognizerView =  IFlyRecognizerView(center: self.view.center)
            iflyRecognizerView?.setParameter("", forKey: IFlySpeechConstant.params())
            iflyRecognizerView?.setParameter("iat", forKey: IFlySpeechConstant.ifly_DOMAIN())
        }
        iflyRecognizerView?.delegate = self
        if iflyRecognizerView != nil {
            let instance : IATConfig =  IATConfig.sharedInstance()
            iflyRecognizerView!.setParameter("iat", forKey: IFlySpeechConstant.ifly_DOMAIN())
            iflyRecognizerView!.setParameter(instance.speechTimeout, forKey: IFlySpeechConstant.speech_TIMEOUT())
            iflyRecognizerView!.setParameter(instance.vadEos, forKey: IFlySpeechConstant.vad_EOS())
            iflyRecognizerView!.setParameter(instance.vadBos, forKey: IFlySpeechConstant.vad_BOS())
            iflyRecognizerView!.setParameter("20000", forKey: IFlySpeechConstant.net_TIMEOUT())
            iflyRecognizerView!.setParameter(instance.sampleRate, forKey: IFlySpeechConstant.sample_RATE())
            if instance.language == IATConfig.chinese() {
                iflyRecognizerView!.setParameter(instance.language, forKey: IFlySpeechConstant.language())
                iflyRecognizerView!.setParameter(instance.accent, forKey: IFlySpeechConstant.accent())
            }else if instance.language == IATConfig.english(){
                iflyRecognizerView!.setParameter(instance.language, forKey: IFlySpeechConstant.language())
            }
            iflyRecognizerView!.setParameter(instance.dot, forKey: IFlySpeechConstant.asr_PTT())
        }
        
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    /// 讯飞语音回调
    public func onError(_ error: IFlySpeechError!) {
        
    }
    public func onResult(_ resultArray: [Any]!, isLast: Bool) {
        
    }
    
    public func onResults(_ results: [Any]!, isLast: Bool) {
        
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
