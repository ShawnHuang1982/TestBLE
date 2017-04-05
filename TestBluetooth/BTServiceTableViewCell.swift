//
//  BTServiceTableViewCell.swift
//  TestBluetooth
//
//  Created by  shawn on 31/03/2017.
//  Copyright © 2017 shawn. All rights reserved.
//

import UIKit

class BTServiceTableViewCell: UITableViewCell {

    @IBOutlet weak var labelDesc: UILabel!
    @IBOutlet weak var labelProperties: UILabel!
    @IBOutlet weak var labelValue: UILabel!
    @IBOutlet weak var labelNotification: UILabel!
    @IBOutlet weak var labelUUID: UILabel!
    @IBOutlet weak var labelPropContent: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
