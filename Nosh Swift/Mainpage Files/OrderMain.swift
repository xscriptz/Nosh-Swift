//
//  OrderMain.swift
//  Nosh Swift
//
//  Created by advatiya prasad on 4/21/16.
//  Copyright © 2016 advatiya prasad. All rights reserved.
//

import UIKit

class OrderMain: UIViewController {

    var queues : Int = 0
    
    @IBOutlet weak var QLabel: UILabel!
    
    @IBOutlet weak var TimrLabel: UILabel!
    var tima : Int = 0
    override func viewDidLoad() {
        super.viewDidLoad()
        QLabel.text = String(queues)
        TimrLabel.text = String(tima)
        
    }
}
