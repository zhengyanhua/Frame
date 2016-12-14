//
//  IflyTextField.swift
//  SwiftFrame
//
//  Created by iOSDeveloper on 2016/11/14.
//  Copyright © 2016年 iOSDeveloper. All rights reserved.
//

import UIKit
//typealias blockType = ()->()
class IflyTextField: UIView {

    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */
    var btnBlock : (()->())?
    init(frame: CGRect , title titleName : String? = nil) {
        super.init(frame : frame)
        if let a = titleName {
            addSubview(labTitle)
            labTitle.text = a
            labTitle.sizeToFit()
            labTitle.top = (frame.height - labTitle.height)/2
        }else{
            textfield.left = 5
            textfield.width = self.frame.width - 10
        }
        
        rightView.addSubview(btn)
        addSubview(labline)
        addSubview(textfield)
        addSubview(labline1)
    }
    lazy var labline : UILabel = {
        let lab = UILabel(frame: CGRect(x: 0, y: 0, width: self.frame.width, height: 0.5))
        lab.backgroundColor = UIColor.HEXColor(color: 0xcccccc)
        return lab
    }()
    
    lazy var labTitle : UILabel = {
        let lab = UILabel(frame: CGRect(x: 5, y: (self.frame.height - 25)/2, width: 60, height: 25))
        lab.font = text_Font
        return lab
    }()
    
    lazy var textfield : UITextField = {
        let textfield = UITextField(frame: CGRect(x: self.labTitle.right + 5, y: (self.frame.height - 35)/2, width: self.frame.width - 10 - self.labTitle.right , height: 35))
        textfield.layer.cornerRadius = 6
        textfield.layer.masksToBounds = true
        textfield.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 5, height: 5))
        textfield.leftViewMode = UITextFieldViewMode.always
        textfield.layer.borderColor = UIColor.HEXColor(color: 0xcccccc).cgColor
        textfield.layer.borderWidth = 0.5
        textfield.rightView = self.rightView
        textfield.rightViewMode = UITextFieldViewMode.always
        textfield.contentVerticalAlignment = .center  //垂直居中对齐
        textfield.clearButtonMode = .whileEditing  //编辑时出现清除按钮
        return textfield
    }()
    
    
    lazy var rightView : UIView = {
        let view : UIView = UIView(frame: CGRect(x: 0, y: 0, width: 40, height: 35))
        view.backgroundColor = UIColor.white
        return view
    }()
    
    lazy var btn : UIButton = {
        let btn = UIButton(type: UIButtonType.custom)
        btn.frame = CGRect(x: 0, y: 0, width: 35, height: 35)
        btn.layer.cornerRadius = 35/2
        btn.layer.masksToBounds = true
        btn.setImage(UIImage(named : "microPhone"), for: UIControlState.normal)
//        btn.backgroundColor = UIColor.green
        btn.addTarget(self, action: #selector(IflyTextField.btnClick(btn:)), for: UIControlEvents.touchUpInside)
        return btn
    }()
    
    lazy var labline1 : UILabel = {
        let lab = UILabel(frame: CGRect(x: 0, y: self.frame.height - 0.5, width: self.frame.width, height: 0.5))
        lab.backgroundColor = UIColor.HEXColor(color: 0xcccccc)
        return lab
    }()
    
    func btnClick(btn:UIButton)  {
        textfield.resignFirstResponder()
        if btnBlock != nil{
            btnBlock!()
        }
    }
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        textfield.resignFirstResponder()
    }
    
}
