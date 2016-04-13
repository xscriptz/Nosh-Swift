//
//  FileVC.swift
//  Nosh Swift
//
//  Created by advatiya prasad on 4/13/16.
//  Copyright © 2016 advatiya prasad. All rights reserved.
//

import UIKit

class FileVC: UIViewController {

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
                 catch {print("wtf")/* error handling here */}
            }
            return nil
        }
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
