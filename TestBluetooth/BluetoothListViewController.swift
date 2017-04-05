//
//  BluetoothListTableViewController.swift
//  TestBluetooth
//
//  Created by  shawn on 30/03/2017.
//  Copyright © 2017 shawn. All rights reserved.
//

import CoreBluetooth
import UIKit


class BluetoothListViewController: UIViewController {
    @IBOutlet weak var indicator: UIActivityIndicatorView!
    @IBOutlet weak var bbScan: UIBarButtonItem!
    @IBOutlet weak var bluetoothListTableView: UITableView!
    var myCentralManager:CBCentralManager? = nil
    var detectedDeviceArray:[String] = []
    var BTPeripheral:[CBPeripheral] = [] //儲存掃到的的peripheral物件
    var BTIsConnectable:[String] = [] //儲存各個藍牙裝置是否可連線
    var BTRSSI:[NSNumber] = [] //儲存各個藍牙裝置的訊號強度
    let RSSI_MEAN = 70
    let RSSI_N = 1
    var firstTime = true
    var peripheral:CBPeripheral?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        bbScan.title = "bluetooth"
        bbScan.isEnabled = false
        self.navigationItem.hidesBackButton = true
        
        let nib1 = UINib(nibName: "BluetoothDeviceInfoTableViewCell", bundle: nil)
        bluetoothListTableView.register(nib1, forCellReuseIdentifier: "Cell")
        bluetoothListTableView.dataSource = self
        bluetoothListTableView.delegate = self
        
        myCentralManager = CBCentralManager(delegate: self, queue: nil)
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        print(#function)
        stopScan2()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func buttonScanBluetoothDevice(_ sender: Any) {
        startScan()
    }
    
    func startScan(){
        print("func startScan")
        myCentralManager?.delegate = self
        indicator.startAnimating()
        bbScan.isEnabled = false
        bbScan.title = "Scanning"
        BTPeripheral.removeAll(keepingCapacity: false)
        BTRSSI.removeAll(keepingCapacity: false)
        BTIsConnectable.removeAll(keepingCapacity: false)
        
        //scan
        myCentralManager?.scanForPeripherals(withServices: nil, options: nil)
        
        Timer.scheduledTimer(timeInterval: 5, target: self, selector: #selector(stopScan), userInfo: nil, repeats: false)
    }
    
    func stopScan(){
        bluetoothListTableView.reloadData()
        myCentralManager?.stopScan()
        bbScan.title = "Scan"
        bbScan.isEnabled = true
        indicator.stopAnimating()
    }

    func stopScan2(){
        myCentralManager?.stopScan()
        bbScan.title = "Scan"
        bbScan.isEnabled = true
        indicator.stopAnimating()
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "gotoBLDeviceConfig"{
            let vc = segue.destination as! BTDeviceConfigViewController
            vc.myPeripheral = sender as! CBPeripheral
            vc.btDeviceName = (sender as! CBPeripheral).name ?? "NoName"
            vc.centralManager = self.myCentralManager
        }
    }
}


