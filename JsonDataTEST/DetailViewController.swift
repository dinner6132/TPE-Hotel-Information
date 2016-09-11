//
//  DetailViewController.swift
//  JsonDataTEST
//
//  Created by 家彥 陳 on 2016/9/11.
//  Copyright © 2016年 Chen-Chia-Yen. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController,NSURLSessionDelegate,NSURLSessionDownloadDelegate {

    @IBOutlet weak var detailDescriptionLabel: UILabel!
    
    var thisHotelAddress:AnyObject?


    var detailItem: AnyObject? {
        didSet {
            // Update the view.
            self.configureView()
        }
    }

    func configureView() {
        // Update the user interface for the detail item.
        if let detail = self.detailItem {
            if let label = self.detailDescriptionLabel {
                label.text = detail.description
            }
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.configureView()
        
        let url = (thisHotelAddress as! [String:AnyObject])["address"]
        
        print("URL \(url)")
        
//        if let url = url //如果有圖片網址，向伺服器請求圖片資料
//        {
//            let sessionWithConfigure = NSURLSessionConfiguration.defaultSessionConfiguration()
//            
//            let session = NSURLSession(configuration: sessionWithConfigure, delegate: self, delegateQueue: NSOperationQueue.mainQueue())
//            
//            let dataTask = session.downloadTaskWithURL(NSURL(string: url as! String)!)
//            
//            dataTask.resume()
//        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func URLSession(session: NSURLSession, downloadTask: NSURLSessionDownloadTask, didFinishDownloadingToURL location: NSURL) {
        
        guard let addressData = NSData(contentsOfURL: location) else {
            return
        }
        
        print("hello \(addressData)")
        
    }


}

