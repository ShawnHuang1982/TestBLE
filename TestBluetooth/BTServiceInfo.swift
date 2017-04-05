//
//  BTServiceInfo.swift
//  TestBluetooth
//
//  Created by  shawn on 31/03/2017.
//  Copyright © 2017 shawn. All rights reserved.
//

import Foundation
import CoreBluetooth

class BTServiceInfo{
    var service:CBService!
    var characteristics:[CBCharacteristic]
    init(service:CBService,characteristics:[CBCharacteristic]) {
        self.service = service
        self.characteristics = characteristics
    }
}
