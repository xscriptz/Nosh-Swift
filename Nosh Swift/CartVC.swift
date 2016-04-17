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
    
    var myArr : NSArray = []
    
    var costString : String = ""
    
    var costInt : Int = 0
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        cashLabel.text = "0"
        print(toPass)
        
        
        
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
        for i in 0..<toPass.count {
            for j in 0..<myArr.count
            {
                if (toPass.objectAtIndex(i)).isEqualToString(String(myArr[j]["ITEM"]))
                {
                    costString = String(myArr[j]["PRICE"]).stringByReplacingOccurrencesOfString("$", withString: "", options: NSStringCompareOptions.LiteralSearch, range: nil)
                    costInt += Int(costString)!
                    print(costInt)
                }
            }
        }
        cashLabel.text = String(costInt)
        

        
        
        
    }
    


}
