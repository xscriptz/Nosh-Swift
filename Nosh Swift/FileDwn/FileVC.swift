//
//  FileVC.swift
//  Nosh Swift
//
//  Created by advatiya prasad on 4/13/16.
//  Copyright © 2016 advatiya prasad. All rights reserved.
//

import UIKit

class FileVC: UIViewController {

    @IBOutlet weak var imageView: UIImageView!
    
    @IBOutlet weak var statusLabel: UILabel!
    
    @IBOutlet weak var progressView: UIProgressView!
    //var progressView: UIProgressView!
    
    var completionHandler: AWSS3TransferUtilityDownloadCompletionHandlerBlock?

    
    override func viewDidLoad() {
        print("Hello")
        super.viewDidLoad()

        

        let downloadFilePath = "/Users/advi/Desktop/Nosh-Swift/Dwnloads/my.json"
        
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
                print(mytext)
                }
                 catch {print("error")/* error handling here */}
            }
            return nil

        }
        // Do any additional setup after loading the view.
        
        
        // Downloading Image files
        
        start()

        
        
        
        
        
    }
    
    
    func start(){
        
        let S3BucketName: String = "nosh-swift"
        let S3DownloadKeyName: String = "Bacon Buffalo Ranch McCh.png"
        
        let downloadFilePath = "/Users/advi/Desktop/Nosh-Swift/Dwnloads/myranch.png"
        
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
    }

}


