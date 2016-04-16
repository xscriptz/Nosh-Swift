//
//  ViewController.swift
//  Nosh Swift
//
//  Created by advatiya prasad on 3/25/16.
//  Copyright © 2016 advatiya prasad. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

var timer = NSTimer()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        timer = NSTimer.scheduledTimerWithTimeInterval(2, target: self, selector: #selector(timerAction), userInfo: nil, repeats: false)
        
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    func timerAction() {
        
        let mapViewControllerObj = self.storyboard?.instantiateViewControllerWithIdentifier("MainpageVCidentifier") as? MainpageVC
        self.navigationController?.pushViewController(mapViewControllerObj!, animated: true)
        
    }
    
    


}

