//
//  ViewController.swift
//  Nosh Swift
//
//  Created by advatiya prasad on 3/25/16.
//  Copyright © 2016 advatiya prasad. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var progressUI: UIActivityIndicatorView!
var timer = NSTimer()

    override func viewDidLoad() {
        super.viewDidLoad()
        progressUI.hidden = true

        
        
        timer = NSTimer.scheduledTimerWithTimeInterval(2, target: self, selector: #selector(timerAction), userInfo: nil, repeats: false)
        progressUI.hidden = false
        progressUI.startAnimating()

        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    func timerAction() {
        progressUI.stopAnimating()

        let mapViewControllerObj = self.storyboard?.instantiateViewControllerWithIdentifier("MainpageVCidentifier") as? MainpageVC
        self.navigationController?.pushViewController(mapViewControllerObj!, animated: true)
        
    }
    
    


}

