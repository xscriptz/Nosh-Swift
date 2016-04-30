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
    
    var Lcount : Int = 1
    
    var emstr : String = ""
    
    var mutedstring : String = ""
    
    @IBOutlet weak var itembyitmLabel: UILabel!
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        cashLabel.text = "0"
        print(toPass)
        passindata = toPass
        cashLabel.text = String(toPass)
        disArray = dataPassed
        itembyitmLabel.numberOfLines = 0
        for i in 0..<disArray.count
        {
            
            var stringo = String(Lcount)
            var mystr = String(disArray[i])
            mutedstring = emstr + stringo + ". " + mystr + "\n"
            emstr = mutedstring
            Lcount += 1

        }
        print(emstr)
        itembyitmLabel.text = emstr
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
    
    @IBAction func ClearButtonPressed(sender: UIButton) {
    
        emstr = ""
        itembyitmLabel.text = emstr
        toPass = 0
        self.disArray.removeAllObjects()
        
        do{
            
            let mainStoryboard = UIStoryboard(name: "Main", bundle: NSBundle.mainBundle())
            let vc : FileVC = mainStoryboard.instantiateViewControllerWithIdentifier("MenuStoryboard") as! FileVC
            vc.amoCounter  = 0
            vc.cartArr = disArray
            //self.presentViewController(vc, animated: true, completion: nil)
        }
        catch
        {
            print(error)
        }
    
    }

    
    
    override func prepareForSegue(segue: UIStoryboardSegue!, sender: AnyObject!) {
        if (segue.identifier == "seguepay") {
            var svc = segue!.destinationViewController as! PayVC;
            svc.toPass = passindata
            svc.dataPassed = disArray

        }
    }
    


}
