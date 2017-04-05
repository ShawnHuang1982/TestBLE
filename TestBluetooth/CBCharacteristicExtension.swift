//
//  CBCharacteristicExtension.swift
//  TestBluetooth
//
//  Created by  shawn on 31/03/2017.
//  Copyright © 2017 shawn. All rights reserved.
//

import Foundation
import CoreBluetooth

extension CBCharacteristic {
    
    func isWritable() -> Bool {
        return (self.properties.intersection(CBCharacteristicProperties.write)) != []
    }
    
    func isReadable() -> Bool {
        return (self.properties.intersection(CBCharacteristicProperties.read)) != []
    }
    
    func isWritableWithoutResponse() -> Bool {
        return (self.properties.intersection(CBCharacteristicProperties.writeWithoutResponse)) != []
    }
    
    func isNotifable() -> Bool {
        return (self.properties.intersection(CBCharacteristicProperties.notify)) != []
    }
    
    func isIdicatable() -> Bool {
        return (self.properties.intersection(CBCharacteristicProperties.indicate)) != []
    }
    
    func isBroadcastable() -> Bool {
        return (self.properties.intersection(CBCharacteristicProperties.broadcast)) != []
    }
    
    func isExtendedProperties() -> Bool {
        return (self.properties.intersection(CBCharacteristicProperties.extendedProperties)) != []
    }
    
    func isAuthenticatedSignedWrites() -> Bool {
        return (self.properties.intersection(CBCharacteristicProperties.authenticatedSignedWrites)) != []
    }
    
    func isNotifyEncryptionRequired() -> Bool {
        return (self.properties.intersection(CBCharacteristicProperties.notifyEncryptionRequired)) != []
    }
    
    func isIndicateEncryptionRequired() -> Bool {
        return (self.properties.intersection(CBCharacteristicProperties.indicateEncryptionRequired)) != []
    }
    
    
    func getPropertyContent() -> String {
        var propContent = ""
        if (self.properties.intersection(CBCharacteristicProperties.broadcast)) != [] {
            propContent += "Broadcast,"
        }
        if (self.properties.intersection(CBCharacteristicProperties.read)) != [] {
            propContent += "Read,"
        }
        if (self.properties.intersection(CBCharacteristicProperties.writeWithoutResponse)) != [] {
            propContent += "WriteWithoutResponse,"
        }
        if (self.properties.intersection(CBCharacteristicProperties.write)) != [] {
            propContent += "Write,"
        }
        if (self.properties.intersection(CBCharacteristicProperties.notify)) != [] {
            propContent += "Notify,"
        }
        if (self.properties.intersection(CBCharacteristicProperties.indicate)) != [] {
            propContent += "Indicate,"
        }
        if (self.properties.intersection(CBCharacteristicProperties.authenticatedSignedWrites)) != [] {
            propContent += "AuthenticatedSignedWrites,"
        }
        if (self.properties.intersection(CBCharacteristicProperties.extendedProperties)) != [] {
            propContent += "ExtendedProperties,"
        }
        if (self.properties.intersection(CBCharacteristicProperties.notifyEncryptionRequired)) != [] {
            propContent += "NotifyEncryptionRequired,"
        }
        return propContent
    }
}
