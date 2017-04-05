//
//  BTDeviceConfigVCExtensionBluetooth.swift
//  TestBluetooth
//
//  Created by  shawn on 31/03/2017.
//  Copyright © 2017 shawn. All rights reserved.
//

import UIKit
import CoreBluetooth

extension BTDeviceConfigViewController:CBPeripheralDelegate{
    
    func peripheral(_ peripheral: CBPeripheral, didDiscoverDescriptorsFor characteristic: CBCharacteristic, error: Error?) {
        print("didDiscoverDescriptorsFor")
    }
    
    func peripheral(_ peripheral: CBPeripheral, didDiscoverServices error: Error?) {
        print("didDiscoverServices")
        for serviceObj in peripheral.services!{
            let service:CBService = serviceObj
            let isServiceIncluded = self.btServices?.filter{
                (item:BTServiceInfo) -> Bool in
                return item.service.uuid == service.uuid
            }
            if isServiceIncluded?.count == 0 {
                btServices?.append(BTServiceInfo(service: service, characteristics: []))
            }
            peripheral.discoverCharacteristics(nil, for: service)
        }
    }
    
    func peripheral(_ peripheral: CBPeripheral, didDiscoverCharacteristicsFor service: CBService, error: Error?) {
        print("didDiscoverCharacteristicsFor")
        let serviceCharacteristics = service.characteristics
        for item in btServices!{
            if item.service.uuid == service.uuid{
                item.characteristics = serviceCharacteristics!
                break
            }
        }
        tableViewService.reloadData()
        indicator.stopAnimating()
    }
    
    func peripheralDidUpdateName(_ peripheral: CBPeripheral) {
        print("didupdateName:\(peripheral.name ?? "NoName")")
    }
    
    func centralManager(_ central: CBCentralManager, didDisconnectPeripheral peripheral: CBPeripheral, error: Error?) {
        print("state:  disconnect:\(peripheral)")
    }
}

extension BTDeviceConfigViewController:CBPeripheralManagerDelegate{
    func peripheralManagerDidUpdateState(_ peripheral: CBPeripheralManager) {
        peripheral.delegate = self
        print("peripheralManagerDidUpdateState")
    }
    
    func peripheralManager(_ peripheral: CBPeripheralManager, central: CBCentral, didSubscribeTo characteristic: CBCharacteristic) {
        print("dididSubscribeTo")
    }
}

extension BTDeviceConfigViewController:CBCentralManagerDelegate{
    
    func centralManager(_ central: CBCentralManager, didDiscover peripheral: CBPeripheral, advertisementData: [String : Any], rssi RSSI: NSNumber) {
        print("didDiscover")
    }

    func centralManager(_ central: CBCentralManager, didFailToConnect peripheral: CBPeripheral, error: Error?) {
        print("state  fail to connect")
    }
    
    func centralManager(_ central: CBCentralManager, didConnect peripheral: CBPeripheral) {
        print("state:  didConnect")
        if peripheral.state == CBPeripheralState.connected{
            bbConnect.title = "Connected"
            bbConnect.isEnabled = false
            peripheral.discoverServices(nil)
        }
    }
    func centralManagerDidUpdateState(_ central: CBCentralManager) {
        print("didUpdate")
        switch central.state {
        case .poweredOn:
            print("BT ON")
        
        case .poweredOff:
            print("BT OFF")
        case .resetting:
            print("BT Reseting")
        case .unknown:
            print("BT Unknow")
        case .unauthorized:
            print("BT Unauthorized")
        case .unsupported:
            print("BT Unsupported")
        }
    }
}
