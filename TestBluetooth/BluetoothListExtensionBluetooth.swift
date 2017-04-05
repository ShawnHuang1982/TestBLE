//
//  BluetoothListExtensionBluetooth.swift
//  TestBluetooth
//
//  Created by  shawn on 31/03/2017.
//  Copyright © 2017 shawn. All rights reserved.
//

import UIKit
import CoreBluetooth


extension BluetoothListViewController:CBPeripheralDelegate{
    func peripheralDidUpdateName(_ peripheral: CBPeripheral) {
        print("didupdateName:\(peripheral.name ?? "didupdateNoname")")
    }
    
    func centralManager(_ central: CBCentralManager, didDisconnectPeripheral peripheral: CBPeripheral, error: Error?) {
        print("state  disconnect:\(peripheral)")
    }
}

extension BluetoothListViewController:CBPeripheralManagerDelegate{
    func peripheralManagerDidUpdateState(_ peripheral: CBPeripheralManager) {
        print("peripheralManagerDidUpdateState")
    }
    
    func peripheral(_ peripheral: CBPeripheral, didDiscoverDescriptorsFor characteristic: CBCharacteristic, error: Error?) {
        print("didDiscoverDescriptorsFor")
    }
}


extension BluetoothListViewController:CBCentralManagerDelegate{
    func centralManagerDidUpdateState(_ central: CBCentralManager) {
        switch central.state {
        case .poweredOn:
            print("BT ON")
            bbScan.isEnabled = true
        case .poweredOff:
            print("BT OFF")
            bbScan.isEnabled = false
        case .resetting:
            print("BT Reseting")
        case .unknown:
            print("BT Unknow")
        case .unauthorized:
            print("BT Unauthorized")
        case .unsupported:
            print("BT Unsupported")
            bbScan.isEnabled = false
        }
    }

    func centralManager(_ central: CBCentralManager, didFailToConnect peripheral: CBPeripheral, error: Error?) {
        print("state  fail to connect")
    }
    
    func centralManager(_ central: CBCentralManager, didDiscover peripheral: CBPeripheral, advertisementData: [String : Any], rssi RSSI: NSNumber) {
        print("Scan到bluretooth\(peripheral.name ?? "NoName") \(peripheral.identifier.uuidString)")
        if BTPeripheral.count == 0{
            BTPeripheral.append(peripheral)
            BTRSSI.append(RSSI)
        }
        let temp = BTPeripheral.filter { (pl)  in
            return pl.identifier.uuidString == peripheral.identifier.uuidString
        }
        if temp.count == 0{
            peripheral.delegate = self
            print("second新增\(peripheral.name ?? "Noname")")
            BTPeripheral.append(peripheral)
            BTRSSI.append(RSSI)
            self.stopScan()
        }
        self.peripheral = peripheral
        self.peripheral?.delegate = self
        bluetoothListTableView.reloadData()        
    }
}

