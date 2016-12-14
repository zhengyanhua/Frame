//
//  TwoViewController.swift
//  SwiftFrame
//
//  Created by iOSDeveloper on 2016/11/16.
//  Copyright © 2016年 iOSDeveloper. All rights reserved.
//

import UIKit

class TwoViewController: BaseTableViewController {
    lazy var manager : SEPrinterManager = {
        let manager = SEPrinterManager.sharedInstance()
        return manager!
    }()
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.white
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(imageName: nil, title: "打印", target: self, action: #selector(TwoViewController.rightAction))
        creatBluetooth()
        
        // Do any additional setup after loading the view.
    }
    func rightAction()  {
        let printer : HLPrinter = getPrinter()
        let mainData = printer.getFinalData()
        if let a = mainData {
            manager.sendPrint(a) { (connectPerpheral, completion, error) in
                print(error ?? "")
            }
        }
    }
    
    func getPrinter() -> HLPrinter {
        let printer : HLPrinter = HLPrinter()
        printer.appendSeperatorLine()
        printer.appendText("地址:北京市使得房间辣开放开发经理发放卡莉法荆防颗粒是否", alignment: HLTextAlignment.left)
        printer.appendText("210921199005022315", alignment: HLTextAlignment.left)
        printer.appendText("LBEPCCAK65X121781", alignment: HLTextAlignment.left)
        printer.appendSeperatorLine()
        return printer
    }
    
    
    func creatBluetooth(){
        manager.startScanPerpheralTimeout(15, success: { [weak self](perpherals, isTimeout) in
            if let a = perpherals {
                self?.dataArray = a
                self?.tableView.reloadData()
            }
        }) { (error) in
            
        }
    }
 
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        if manager.connectedPerpheral != nil {
            manager.autoConnectLastPeripheralTimeout(15, completion: {[weak self] (perpheral, error) in
                print(self?.manager.connectedPerpheral.name ?? "")
            })
        }else{
        
        }
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        manager.cancel(manager.connectedPerpheral)
        manager.setDisconnect { (perpheral, error) in
            if error == nil {
               
            }else{
                
            }
        }
    }
    
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.dataArray.count
    }
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cellName : String = "cellName"
        var cell : UITableViewCell? = tableView.dequeueReusableCell(withIdentifier: cellName)
        if cell == nil {
            cell = UITableViewCell(style: UITableViewCellStyle.default, reuseIdentifier: cellName)
        }
        let peripherral : CBPeripheral = self.dataArray[indexPath.row] as! CBPeripheral
        cell?.textLabel?.text = peripherral.name
        return cell!
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        let peripherral : CBPeripheral = self.dataArray[indexPath.row] as! CBPeripheral
        manager.connect(peripherral) {[weak self] (perpheral, error) in
            if error == nil {
                self!.showHudAuto("连接成功", andDuration: 2)
            }else{
                self!.showHudAuto("连接失败", andDuration: 2)
            }
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
