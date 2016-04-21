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
    
    var toPass:Int = 0
    
    var myArr : NSArray = []
    
    var dataPassed = NSMutableArray()
    var passindata : Int = 0
    
    var disArray = NSMutableArray()
    
    var costString : String = ""
    
    var costInt : Int = 0
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        cashLabel.text = "0"
        print(toPass)
        passindata = toPass
        cashLabel.text = String(toPass)
        disArray = dataPassed
        print(disArray)
        /*
        
        do {
            let downloadFilePath = "/Users/advi/Desktop/Nosh-Swift/Nosh Swift/Dwnloads/my.json"
            let mytext = try NSString(contentsOfFile: downloadFilePath, encoding: NSUTF8StringEncoding)
            let data = mytext.dataUsingEncoding(NSUTF8StringEncoding, allowLossyConversion:false);
            let json:AnyObject = try NSJSONSerialization.JSONObjectWithData(data!, options: NSJSONReadingOptions.AllowFragments)
            
            
            if let nsDictionaryObject = json as? NSDictionary {
                if let swiftDictionary = nsDictionaryObject as Dictionary? {
                    print(swiftDictionary)
                }
            }
            else if let nsArrayObject = json as? NSArray {
                if let swiftArray = nsArrayObject as Array? {
                    self.myArr = swiftArray
                    print(swiftArray[0]["PRICE"])
                }
            }
            
            
            
            
            //print(mytext)
        }
        catch {print("error")/* error handling here */}
        for i in 0..<self.toPass.count {
            for j in 0..<self.myArr.count
            {
                if (toPass.objectAtIndex(i)).isEqualToString(String(myArr[j]["ITEM"]))
                {
                    self.costString = String(self.myArr[j]["PRICE"]).stringByReplacingOccurrencesOfString("$", withString: "", options: NSStringCompareOptions.LiteralSearch, range: nil)
                    if let tempo = Int(self.costString)
                    {
                        self.costInt += tempo
                    }
                    //costInt += Int(costString)!
                    print(self.costString)
                    print(self.costInt)
                }
            }
        }
        cashLabel.text = String(self.costInt)
        */

        
        
        
    }
    
    
    override func prepareForSegue(segue: UIStoryboardSegue!, sender: AnyObject!) {
        if (segue.identifier == "seguepay") {
            var svc = segue!.destinationViewController as! PayVC;
            svc.toPass = passindata
            
        }
    }
    


}
