//
//  BTDeviceConfigVCExtensionTableView.swift
//  TestBluetooth
//
//  Created by  shawn on 31/03/2017.
//  Copyright © 2017 shawn. All rights reserved.
//

import UIKit
import CoreBluetooth

extension BTDeviceConfigViewController:UITableViewDelegate,UITableViewDataSource{
    func numberOfSections(in tableView: UITableView) -> Int {
        return (btServices?.count)!
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return (btServices![section].characteristics.count)
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableViewService.dequeueReusableCell(withIdentifier: "BTServiceTableViewCell", for: indexPath) as! BTServiceTableViewCell
        cell.labelDesc.text = btServices?[indexPath.section].characteristics[indexPath.row].uuid.uuidString
        cell.labelUUID.text = btServices?[indexPath.section].characteristics[indexPath.row].uuid.description
        cell.labelProperties.text = String(format: "0x%02x", (btServices?[indexPath.section].characteristics[indexPath.row].properties.rawValue)!)
        cell.labelValue.text = btServices?[indexPath.section].characteristics[indexPath.row].value?.description ?? "null"
        cell.labelNotification.text = btServices?[indexPath.section].characteristics[indexPath.row].getPropertyContent()
        return cell
    }
}
