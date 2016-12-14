//
//  IflyTextView.swift
//  SwiftFrame
//
//  Created by iOSDeveloper on 2016/11/23.
//  Copyright © 2016年 iOSDeveloper. All rights reserved.
//

import UIKit

let MAX_LIMIT_NUMS = UIScreen.main.bounds.size.width - 60
class IflyTextView: UIView , UITextViewDelegate {
    var sheight: CGFloat?
    
    override init(frame: CGRect) {
        sheight = 0
        super.init(frame: frame)
        addSubview(labline)
        addSubview(textView)
        addSubview(labline1)
        addSubview(btn)
//        self.frame = CGRect(x: frame.origin.x, y: frame.origin.y, width: frame.width, height: labline1.bottom + 10)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
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
    
    lazy var textView : UITextView = {
        let textView = UITextView(frame: CGRect(x: 10, y: 10, width: self.frame.width - 60 , height: 34))
        textView.layer.cornerRadius = 6
        textView.font = UIFont.systemFont(ofSize: 15)
        textView.layer.masksToBounds = true
        textView.layer.borderColor = UIColor.HEXColor(color: 0xcccccc).cgColor
        textView.layer.borderWidth = 0.5
        textView.delegate = self
        textView.isScrollEnabled = false
        return textView
    }()
    
    lazy var btn : UIButton = {
        let btn = UIButton(type: UIButtonType.custom)
        btn.frame = CGRect(x: self.frame.width - 45, y: 10, width: 35, height: 35)
        btn.layer.cornerRadius = 35/2
        btn.layer.masksToBounds = true
        btn.setImage(UIImage(named : "microPhone"), for: UIControlState.normal)
        //        btn.backgroundColor = UIColor.green
        btn.addTarget(self, action: #selector(IflyTextField.btnClick(btn:)), for: UIControlEvents.touchUpInside)
        return btn
    }()
    
    lazy var labline1 : UILabel = {
        let lab = UILabel(frame: CGRect(x: 0, y: self.textView.bottom + 10, width: self.frame.width, height: 0.5))
        lab.backgroundColor = UIColor.HEXColor(color: 0xcccccc)
        return lab
    }()
    
    func btnClick(btn:UIButton)  {
        textView.resignFirstResponder()
    }

    func textViewDidChange(_ textView: UITextView) {
        let maxHeight : CGFloat = 87.6666666666667
        let frame : CGRect = textView.frame
        let constraintSize : CGSize = CGSize(width: frame.size.width, height: CGFloat(MAXFLOAT))
        var size : CGSize = textView.sizeThatFits(constraintSize)
//        var size : CGSize = getStringRectInTextView(string: textView.text, textView: textView)
        if size.height <= frame.size.height {
            //            size.height = frame.size.height
        }else{
            if size.height > maxHeight{
                size.height = maxHeight
                textView.isScrollEnabled = true   // 允许滚动
            }else{
                textView.isScrollEnabled = false    // 不允许滚动
            }
        }
        print("<--->",size.height)
        textView.frame = CGRect(x: frame.origin.x, y: frame.origin.y, width: frame.size.width, height: size.height)
        labline1.bottom = self.textView.bottom + 10
        self.frame = CGRect(x: self.origin.x, y: self.origin.y, width: self.frame.width, height: labline1.bottom + 10)
        
        
        
        
//        let selectedRange : UITextRange? = textView.markedTextRange
//        if let a = selectedRange{
//            let pos : UITextPosition? = textView.position(from: a.start, offset: 0)
//            if selectedRange != nil && pos != nil {
//                return
//            }
//        }
//        let nsTextContent : String  = textView.text
//        let existTextNum : Int = nsTextContent.characters.count
//        if CGFloat(existTextNum) > MAX_LIMIT_NUMS {
//            let i = nsTextContent.index(nsTextContent.startIndex, offsetBy: Int(MAX_LIMIT_NUMS))
//            let s = nsTextContent.substring(to: i)
//            textView.text = s
//        }
//        refreshTextViewSize(textView: textView)
    }
    func refreshTextViewSize(textView : UITextView) -> Void {
//        let  size : CGSize = textView.sizeThatFits(CGSize(width: textView.width, height: CGFloat(MAXFLOAT)))
//        var frame = textView.frame
//        frame.size.height = size.height
//        textView.frame = frame
    }
    
    func getStringRectInTextView(string : String , textView : UITextView) -> CGSize {
        var contentWidth : CGFloat = textView.width
        let broadWith = (textView.contentInset.left + textView.contentInset.right
            + textView.textContainerInset.left
            + textView.textContainerInset.right
            + textView.textContainer.lineFragmentPadding/*左边距*/
            + textView.textContainer.lineFragmentPadding/*右边距*/)
        let broadHeight : CGFloat  = (textView.contentInset.top
            + textView.contentInset.bottom
            + textView.textContainerInset.top
            + textView.textContainerInset.bottom)
        contentWidth = contentWidth - broadWith
        let InSize : CGSize = CGSize(width: contentWidth, height: CGFloat(MAXFLOAT))
        let paragraphStyle : NSMutableParagraphStyle = NSMutableParagraphStyle()
        paragraphStyle.lineBreakMode = textView.textContainer.lineBreakMode
        var dic = [String : Any]()
        dic[NSFontAttributeName] = textView.font
        dic[NSParagraphStyleAttributeName] = paragraphStyle
        let str : NSString = string as NSString
        let calculatedSize : CGSize = str.boundingRect(with: InSize, options: OCUtils.stringDrawingOptions(), attributes: dic, context: nil).size
        let adjustedSize : CGSize = CGSize(width: CGFloat(ceilf(Float(calculatedSize.width))), height: calculatedSize.height + broadHeight)
        return adjustedSize
    }
    
//    func textView(_ textView: UITextView, shouldChangeTextIn range: NSRange, replacementText text: String) -> Bool {
//        if text.characters.count == 0 {
//            return true
//        }
//        let selectedRange : UITextRange? = textView.markedTextRange
//        if let a = selectedRange{
//            let pos : UITextPosition? = textView.position(from: a.start, offset: 0)
//            if selectedRange != nil &&  pos != nil{
//                let startOffset  = textView.offset(from: textView.beginningOfDocument, to: a.start)
//                let endOffset  = textView.offset(from: textView.beginningOfDocument, to: a.end)
//                let offsetRange : NSRange = NSMakeRange(startOffset, endOffset - startOffset)
//                if offsetRange.location < Int(MAX_LIMIT_NUMS) {
//                    return true
//                }else{
//                    return false
//                }
//            }
//        }
//        let str = textView.text as NSString
//        let comcatstr = str.replacingCharacters(in: range, with: text)
//        let caninputlen = Int(MAX_LIMIT_NUMS) - comcatstr.characters.count
//        if caninputlen >= 0 {
//            let size : CGSize = getStringRectInTextView(string: comcatstr, textView: textView)
//            var frame = textView.frame
//            frame.size.height = size.height
//            textView.frame = frame
//            return true
//        }else{
//            let len = text.characters.count + caninputlen
//            let rg : NSRange = NSRange.init(location: 0, length: max(len, 0))
//            if rg.length > 0 {
//                var s : NSString = ""
//                let x : UInt = 1
//                let textStr : NSString = text as NSString
//                let asc = textStr.canBeConverted(to: x)
//                if asc {
//                    s = textStr.substring(with: rg) as NSString
//                }else{
//                    var idx = 0
//                    var trimString : NSString = ""
//                    textStr.enumerateSubstrings(in: NSMakeRange(0, textStr.length), options: NSString.EnumerationOptions.byComposedCharacterSequences, using: { (substring, substringRange, enclosingRange, stop) in
//                        if let a  = substring{
//                            let steplen = a.characters.count
//                            if (idx >= rg.length) {
//                                //                                    stop = true
//                                //取出所需要break，提高效率
//                                return
//                            }
//                            trimString = trimString.appending(a) as NSString
//                            idx = idx + steplen
//                        }
//                    })
//                    s = trimString
//                }
//                textView.text  = str.replacingCharacters(in: range, with: s as String)
//                refreshTextViewSize(textView: textView)
//            }
//            return false
//        }
//    }
}
