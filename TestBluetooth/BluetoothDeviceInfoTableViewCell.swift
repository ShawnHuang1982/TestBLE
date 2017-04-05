//
//  BluetoothDeviceInfoTableViewCell.swift
//  TestBluetooth
//
//  Created by  shawn on 30/03/2017.
//  Copyright © 2017 shawn. All rights reserved.
//

import UIKit

class BluetoothDeviceInfoTableViewCell: UITableViewCell {

    @IBOutlet weak var labelBLName: UILabel!
    @IBOutlet weak var labelBLSignal: UILabel!
    @IBOutlet weak var labelBLDistance: UILabel!
    @IBOutlet weak var labelBLUuid: UILabel!
    @IBOutlet weak var labelBLConnectable: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
