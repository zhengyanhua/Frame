//
//  BaseTableViewController.swift
//  SwiftFrame
//
//  Created by iOSDeveloper on 2016/10/20.
//  Copyright © 2016年 iOSDeveloper. All rights reserved.
//

import UIKit
import Foundation
import MJRefresh

class BaseTableViewController: BaseViewController ,UITableViewDelegate , UITableViewDataSource{
    //  页数索引
    var pageNO : Int = 1
    //  每页显示多少条
    var pageSize : Int = 15
    //  是否还有没有显示的数据
    var isEndForLoadmore : Bool?
    //  数据源
    lazy var dataArray : [Any] = {
        let array = [Any]()
        return array
    }()
    //  UITableViewStyle
    var tableViewStyle : UITableViewStyle = .plain
    
    
    
    //  tableView
    lazy var tableView : UITableView = {
        let table = UITableView(frame: self.view.frame, style: self.tableViewStyle)
        table.delegate = self
        table.dataSource = self
        table.backgroundColor = UIColor.clear
        table.tableFooterView = UIView(frame: CGRect.zero)
        return table
    }()
    func setTableViewStyle(style : UITableViewStyle) {
        tableViewStyle = style
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.clear
        self.view.addSubview(self.tableView)
        // Do any additional setup after loading the view.
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    //  开启头部刷新
    func isOpenHeaderRefresh(isOpen : Bool) {
        if isOpen == true {
            self.tableView.mj_header = MJRefreshNormalHeader(refreshingBlock: { [weak self]() -> Void in
                print("MJ:(下拉刷新)")
                self?.pageNO = 1
                self?.headerRequestWithData()
            })
        }
    }
    //  开启脚部刷新
    func isOpenFooterRefresh(isOpen : Bool) {
        if isOpen == true {
            self.tableView.mj_footer = MJRefreshBackNormalFooter(refreshingBlock: {[weak self] () -> Void in
                print("MJ:(上拉加载)")
                
                self?.pageNO += 1
                self?.footerRequestWithData()
            })
        }
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 0
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell : UITableViewCell = UITableViewCell()
        return cell
        
    }


    func headerRequestWithData() {
        
    }
    func footerRequestWithData() {
        
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
