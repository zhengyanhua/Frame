//
//  FirstViewController.swift
//  SwiftFrame
//
//  Created by iOSDeveloper on 2016/11/14.
//  Copyright © 2016年 iOSDeveloper. All rights reserved.
//

import UIKit

class FirstViewController: BaseTableViewController{
    var str : String = ""
    
    lazy var btn : UIButton = {
        let btn : UIButton = UIButton(type: UIButtonType.custom)
        btn.frame = CGRect(x: 10, y: 100, width: DeviceSize.width - 20, height: 40)
        btn.backgroundColor = UIColor.green
        btn.addTarget(self, action:#selector(FirstViewController.btnClick(btn:)), for: UIControlEvents.touchUpInside)
        return btn
    }()
    
    lazy var text : IflyTextField = {
        let text = IflyTextField(frame: CGRect(x: 0, y: 200, width: DeviceSize.width, height: 40), title: "语音测试")
        
        text.btnBlock = { [weak self]() -> () in
            self?.str = ""
            self?.text.textfield.text = ""
            self?.iflyRecognizerView?.start()
            self?.text.textfield.resignFirstResponder()
        }
        return text
    }()
    
    lazy var textView : IflyTextView = {
        let text : IflyTextView = IflyTextView(frame: CGRect(x: 0, y: 300, width: DeviceSize.width, height: 90))
        return text
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.white
        self.view.addSubview(btn)
        self.view.addSubview(text)
        self.view.addSubview(textView)
        // Do any additional setup after loading the view.
    }

    
    func btnClick(btn : UIButton)  {
        self.view.endEditing(true)
        let tvc = TwoViewController()
        self.navigationController?.pushViewController(tvc, animated: true)
    }
    override func onResult(_ resultArray: [Any]!, isLast: Bool) {
        if let a = resultArray {
            let dic = a[0]
            let dict  = dic as! NSDictionary
            for key in dict.allKeys {
                str = str + (key as! String)
            }
            print("--->:::%@",str)
            self.text.textfield.text = str
        }
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
