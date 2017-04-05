//
//  BluetoothListExtensionTableView.swift
//  TestBluetooth
//
//  Created by  shawn on 31/03/2017.
//  Copyright © 2017 shawn. All rights reserved.
//

import UIKit
import CoreBluetooth

extension BluetoothListViewController:UITableViewDataSource,UITableViewDelegate{
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return BTPeripheral.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! BluetoothDeviceInfoTableViewCell
        cell.labelBLName.text = BTPeripheral[indexPath.row].name ?? "NoName"
        cell.labelBLSignal.text = "\(BTRSSI[indexPath.row])"
        cell.labelBLDistance.text = "\(Double(abs(BTRSSI[indexPath.row].int32Value) - RSSI_MEAN) / Double(10 * RSSI_N))"
        cell.labelBLUuid.text = BTPeripheral[indexPath.row].identifier.uuidString
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("didSelectCell")
        self.performSegue(withIdentifier: "gotoBLDeviceConfig", sender: BTPeripheral[indexPath.row])
    }
    
}
