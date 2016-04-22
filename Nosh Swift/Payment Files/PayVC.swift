//
//  PayVC.swift
//  Nosh Swift
//
//  Created by advatiya prasad on 4/21/16.
//  Copyright © 2016 advatiya prasad. All rights reserved.
//

import UIKit

class PayVC: UIViewController {
    
    @IBOutlet weak var AmountLabel: UILabel!
    @IBOutlet weak var emailText: UITextField!
    @IBOutlet weak var cardnoText: UITextField!
    @IBOutlet weak var monthText: UITextField!
    @IBOutlet weak var yearText: UITextField!
    @IBOutlet weak var cvcText: UITextField!
    
    @IBOutlet weak var progressbar: UIActivityIndicatorView!
    var que : Int = 0
    var toPass : Int = 0
    var amodata : Int = 0
    var timr : Int =  0
    override func viewDidLoad() {
        super.viewDidLoad()
        progressbar.hidden = true
        amodata = toPass
        
        
        AmountLabel.text = String(amodata)
        
        
        
        
        
    }
    
    
   
    
    @IBAction func PayButtonPressed(sender: UIButton) {
        
        
        progressbar.hidden = false
        progressbar.startAnimating()
        let alert = UIAlertController(title: "Alert", message: "Message", preferredStyle: UIAlertControllerStyle.Alert)
        alert.addAction(UIAlertAction(title: "Click", style: UIAlertActionStyle.Default, handler: nil))
        var cardNum : Int = 0
        var exMonth : Int = 0
        var exxYea : Int = 0
        var cvcdat : Int = 0
        timr = 5
        do
        {
            cardNum = Int(cardnoText.text!.stringByReplacingOccurrencesOfString("-", withString: "", options: NSStringCompareOptions.LiteralSearch, range: nil))!
        }
        catch
        {
            
            alert.message = "Invalid Card Number"
            self.presentViewController(alert, animated: true, completion: nil)
            
        }
        do
        {
            
            exMonth = Int(monthText.text!)!
        }
        catch
        {
            alert.message = "Invalid Month Entered"
            self.presentViewController(alert, animated: true, completion: nil)
            
        }
        do
        {
            
            
            exxYea = Int(yearText.text!)!
        }
        catch
        {
            alert.message = "Invalid Year Entered"
            self.presentViewController(alert, animated: true, completion: nil)
            
        }
        do
        {
            cvcdat = Int(cvcText.text!)!
        }
        catch
        {
            alert.message = "Invalid CVC Entered"
            self.presentViewController(alert, animated: true, completion: nil)
            
        }
        progressbar.stopAnimating()
        progressbar.hidden = true
        if cardNum < 1000000000000000
        {
            print("Invalid Card Number")
            alert.message = "Invalid Card Number!"
            self.presentViewController(alert, animated: true, completion: nil)
            
            
        }
        else if exMonth < 0 || exMonth > 12
        {
            print("Invalid Month Entered")
            alert.message = "Invalid Month!"
            self.presentViewController(alert, animated: true, completion: nil)
        }
        else if exxYea < 2016
        {
            print("Invalid Year Entered")
            alert.message = "Invalid Year!"
            self.presentViewController(alert, animated: true, completion: nil)
            
        }
        else if cvcdat < 100 || cvcdat > 999
        {
            print("Invalid CVC Entered")
            alert.message = "Invalid CVC!"
            self.presentViewController(alert, animated: true, completion: nil)
            
        }
        else
        {
            print("Transaction Successful!")
            //alert.message = "Transaction Successful!"
            que += 1
            //self.presentViewController(alert, animated: true, completion: nil)
            do{
                
            let mainStoryboard = UIStoryboard(name: "Main", bundle: NSBundle.mainBundle())
            let vc : MainpageVC = mainStoryboard.instantiateViewControllerWithIdentifier("MainpageVCidentifier") as! MainpageVC
                vc.queues  = que
                vc.tima = timr
            self.presentViewController(vc, animated: true, completion: nil)
            }
            catch
            {
                print(error)
            }
            
            
        }
        
        
    }
    
    /*override func prepareForSegue(segue: UIStoryboardSegue!, sender: AnyObject!) {
        let next = self.storyboard?.instantiateViewControllerWithIdentifier("OrdrMainid") as! OrderMain
        self.presentViewController(next, animated: false, completion: nil)
        next.tima = timr
        next.queues = que
        self.presentViewController(next, animated: false, completion: nil)

        
       /* if (segue.identifier == "segueorder") {
            var svc = segue!.destinationViewController as! OrderMain;
            svc.toPass = que
            svc.dataPassed = timr
            
        }*/
    }*/
    
    

}
