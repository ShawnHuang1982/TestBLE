//
//  BTDeviceConfigViewController.swift
//  TestBluetooth
//
//  Created by  shawn on 30/03/2017.
//  Copyright © 2017 shawn. All rights reserved.
//

import CoreBluetooth
import UIKit

class BTDeviceConfigViewController: UIViewController {
    @IBOutlet weak var indicator: UIActivityIndicatorView!
    @IBOutlet weak var bbConnect: UIBarButtonItem!
    @IBOutlet weak var tableViewService: UITableView!

    var myPeripheral : CBPeripheral!
    var centralManager : CBCentralManager!
    var btDeviceName = ""
    var btServices: [BTServiceInfo]?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.title = btDeviceName
        
        let nib = UINib(nibName: "BTServiceTableViewCell", bundle: nil)
        tableViewService.register(nib, forCellReuseIdentifier: "BTServiceTableViewCell")
        tableViewService.dataSource = self
        tableViewService.delegate = self
        
        btServices = []
        
        indicator.startAnimating()
    
        myPeripheral.delegate = self
        
        centralManager.connect(myPeripheral, options: nil)
        centralManager.delegate = self
        
        switch myPeripheral.state {
        case CBPeripheralState.connected:
            bbConnect.title = "Connect"
            print("Connect")
        case CBPeripheralState.connecting:
            bbConnect.title = "Connecting"
            print("Connecting")
        case CBPeripheralState.disconnected:
            bbConnect.title = "disconnected"
            print("disconnected")
        case CBPeripheralState.disconnecting:
            bbConnect.title = "disconnecting"
            print("disconnecting")
        }
    }
    
    override func viewDidAppear(_ animated: Bool) {
    }

    override func viewWillDisappear(_ animated: Bool) {
        centralManager.cancelPeripheralConnection(myPeripheral)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}
