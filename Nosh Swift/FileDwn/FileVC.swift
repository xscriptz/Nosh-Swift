//
//  FileVC.swift
//  Nosh Swift
//
//  Created by advatiya prasad on 4/13/16.
//  Copyright © 2016 advatiya prasad. All rights reserved.
//

import UIKit

class FileVC: UIViewController {

    @IBOutlet weak var countlabel: UILabel!
    @IBOutlet weak var itemimg: UIImageView!
    var counter = 0
    //@IBOutlet weak var imageView: UIImageView!
    var myArr : NSArray = []
    
    //@IBOutlet weak var statusLabel: UILabel!
    
    //@IBOutlet weak var progressView: UIProgressView!
    //var progressView: UIProgressView!
    
    var completionHandler: AWSS3TransferUtilityDownloadCompletionHandlerBlock?

    override func viewDidLoad() {
        itemimg.alpha = 0.2
        itemimg.hidden = true
        print("Hello")
        
        super.viewDidLoad()

        

        let downloadFilePath = "/Users/advi/Desktop/Nosh-Swift/Nosh Swift/Dwnloads/my.json"
        
        let downloadingFileURL = NSURL.fileURLWithPath(downloadFilePath)
        
        let downloadRequest = AWSS3TransferManagerDownloadRequest()

        downloadRequest.bucket = "nosh-swift"

        downloadRequest.key = "mcdonalstest1.json" //fileName on s3

        downloadRequest.downloadingFileURL = downloadingFileURL
        

        let transferManager = AWSS3TransferManager.defaultS3TransferManager()
        transferManager.download(downloadRequest).continueWithBlock {
            (task:AWSTask!)  ->  AnyObject!  in
            if task.error != nil {
                print("Error downloading")
                print(task.error!.description)
            }
            else {
                print(downloadFilePath)
                 do {
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
            }
            return nil
            
            
            
            
            

        }
        
        
        
        /*let path = "/Users/advi/Desktop/Nosh-Swift/Nosh Swift/Dwnloads/my.json"
        
        //let downloadingFileURL = NSURL.fileURLWithPath(downloadFilePath)
        let bundle = NSBundle.mainBundle()
        //let path = bundle.pathForResource("/Users/advi/Desktop/Nosh-Swift/Nosh Swift/Dwnloads/my.json", ofType: "json")
        var error:NSError?
        var data:NSData = NSData(contentsOfFile: path)!
        do
        {
            let json:AnyObject = try NSJSONSerialization.JSONObjectWithData(data, options: NSJSONReadingOptions.AllowFragments)
            // JSONObjectWithData returns AnyObject so the first thing to do is to downcast this to a known type
            if let nsDictionaryObject = json as? NSDictionary {
                if let swiftDictionary = nsDictionaryObject as Dictionary? {
                    print(swiftDictionary)
                }
            }
            else if let nsArrayObject = json as? NSArray {
                if let swiftArray = nsArrayObject as Array? {
                    print(swiftArray[0]["PRICE"])
                }
            }
            
        }
        catch
        {
            print(error)
        }
        */
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        // Do any additional setup after loading the view.
        
        
        // Downloading Image files
        
        //start()

        
        
        
        
        
    }
    
    @IBAction func bbmcButtonClicked(sender: UIButton) {
        
        itemimg.hidden = false
        counter += 1
        countlabel.text = String(counter)
        let cost = String(myArr[5]["PRICE"])
        print(cost)
    }
    /*func start(){
        
        let S3BucketName: String = "nosh-swift"
        let S3DownloadKeyName: String = "Bacon Buffalo Ranch McCh.png"
        
        let downloadFilePath = "/Users/advi/Desktop/Nosh-Swift/Nosh Swift/Dwnloads/myranch.png"
        
        let downloadingFileURL = NSURL.fileURLWithPath(downloadFilePath)
        
        
        let expression = AWSS3TransferUtilityDownloadExpression()
        expression.downloadProgress = {(task: AWSS3TransferUtilityTask, bytesSent: Int64, totalBytesSent: Int64, totalBytesExpectedToSend: Int64) in
            dispatch_async(dispatch_get_main_queue(), {
                let progress = Float(totalBytesSent) / Float(totalBytesExpectedToSend)
                self.progressView.progress = progress
                self.statusLabel.text = "Downloading..."
                NSLog("Progress is: %f",progress)
                
            })
        }
        
        self.completionHandler = { (task, location, data, error) -> Void in
            dispatch_async(dispatch_get_main_queue(), {
                if ((error) != nil){
                    NSLog("Failed with error")
                    NSLog("Error: %@",error!);
                    self.statusLabel.text = "Failed"
                }
                else if(self.progressView.progress != 1.0) {
                    self.statusLabel.text = "Failed"
                    NSLog("Error: Failed - Likely due to invalid region / filename")
                }
                else if ((data) != nil){
                    self.statusLabel.text = "Success"
                    self.imageView.image = UIImage(data: data!)
                }
                else{
                    print(data)
                }
            })
        }
        
        let transferUtility = AWSS3TransferUtility.defaultS3TransferUtility()
        
        transferUtility.downloadToURL(downloadingFileURL, bucket: S3BucketName, key: S3DownloadKeyName, expression: expression, completionHander: completionHandler).continueWithBlock { (task) -> AnyObject! in
            if let error = task.error {
                NSLog("Error: %@",error.localizedDescription);
                self.statusLabel.text = "Failed"
            }
            if let exception = task.exception {
                NSLog("Exception: %@",exception.description);
                self.statusLabel.text = "Failed"
            }
            if let _ = task.result {
                self.statusLabel.text = "Starting Download"
                NSLog("Download Starting!")
                // Do something with uploadTask.
            }
            return nil;
        }
    }*/

}


