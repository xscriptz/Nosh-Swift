//
//  CartVC.swift
//  
//
//  Created by advatiya prasad on 4/16/16.
//
//

import UIKit

class CartVC: UIViewController {
    
    @IBOutlet weak var cashLabel: UILabel!
    
    var toPass:NSMutableArray = []

    override func viewDidLoad() {
        
        super.viewDidLoad()
        cashLabel.text = "0"
        print(toPass)

        
        
        
    }
    


}
