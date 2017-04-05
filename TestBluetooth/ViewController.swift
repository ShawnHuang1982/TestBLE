//
//  ViewController.swift
//  TestBluetooth
//
//  Created by  shawn on 30/03/2017.
//  Copyright © 2017 shawn. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func viewDidAppear(_ animated: Bool) {
        performSegue(withIdentifier: "gotoBLlist", sender: nil)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

