//
//  MainpageVC.swift
//  Nosh Swift
//
//  Created by advatiya prasad on 3/25/16.
//  Copyright © 2016 advatiya prasad. All rights reserved.
//

import UIKit

class MainpageVC: UIViewController {

    @IBOutlet weak var usernameLabel: UILabel!
    @IBOutlet weak var TLabel: UILabel!
    @IBOutlet weak var QLabel: UILabel!
    var queues : Int = 0
    var tima : Int = 0
    var timer = NSTimer()
    var counter = 0
    var seccounter = 60
    
    @IBOutlet weak var ColonLabel: UILabel!
    
    @IBOutlet weak var STLabel: UILabel!
    
    @IBOutlet weak var QRimage: UIImageView!
    var randonum : Int = 0
    override func viewDidLoad() {
        super.viewDidLoad()
        ColonLabel.hidden = true
        counter = tima
        if(randonum > 0)
        {
            /*let textData = String(randonum).dataUsingEncoding(NSISOLatin1StringEncoding, allowLossyConversion: false)
            let filter = CIFilter(name: "CIQRCodeGenerator")
            filter!.setValue(textData, forKey: "inputMessage")
            filter!.setValue("H", forKey: "inputCorrectionLevel") // error-correction level: H=30%, Q=25%, M=15% (default), L=7%
            //QRimage.image = UIImage(CIImage:filter!.outputImage!)
            let image = UIImage(CIImage: filter!.outputImage!)
            QRimage.image = image
            self.view.addSubview(QRimage)*/
            ColonLabel.hidden = false

            let ciImageFromQRCode = generateQRCodeFromString(String(randonum))
            let scaleX = (QRimage.frame.size.width / ciImageFromQRCode.extent.size.width)
            let scaleY = (QRimage.frame.size.height / ciImageFromQRCode.extent.size.height)
            
            let imgTransformed = ciImageFromQRCode.imageByApplyingTransform(CGAffineTransformMakeScale(scaleX, scaleY))
            
            QRimage.image = UIImage(CIImage:imgTransformed)


        }

        QLabel.text = String(queues)
        TLabel.text = String(counter)
        print(queues)
        print(tima)
        timer = NSTimer.scheduledTimerWithTimeInterval(0.4, target:self, selector: Selector("updateCounter"), userInfo: nil, repeats: true)

        // Do any additional setup after loading the view.
    }

    
    func updateCounter() {
        if(counter > 0) {
          if(seccounter > 0)
          {
            
            STLabel.text = String(seccounter--)
            }
          else{
            TLabel.text = String(counter--)
            seccounter = 60
            counter -= 1

            }
        }
    }
    
    func generateQRCodeFromString(strQR:String) -> CIImage {
        let dataString = strQR.dataUsingEncoding(NSISOLatin1StringEncoding)
        
        let qrFilter = CIFilter(name:"CIQRCodeGenerator")
        qrFilter?.setValue(dataString, forKey: "inputMessage")
        return (qrFilter?.outputImage)!
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(true)
        
        let prefs:NSUserDefaults = NSUserDefaults.standardUserDefaults()
        let isLoggedIn:Int = prefs.integerForKey("ISLOGGEDIN") as Int
        if (isLoggedIn != 1) {
            self.performSegueWithIdentifier("goto_login", sender: self)
        } else {
            self.usernameLabel.text = prefs.valueForKey("USERNAME") as! NSString as String
        }
        
        
    }
    
    @IBAction func LogoutTapped(sender: UIButton) {
        let appDomain = NSBundle.mainBundle().bundleIdentifier
        NSUserDefaults.standardUserDefaults().removePersistentDomainForName(appDomain!)
        
        self.performSegueWithIdentifier("goto_login", sender: self)
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
