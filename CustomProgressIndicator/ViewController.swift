//
//  ViewController.swift
//  CustomProgressIndicator
//
//  Created by Alexander Blokhin on 22.12.15.
//  Copyright © 2015 Alexander Blokhin. All rights reserved.
//

import UIKit

class ViewController: UIViewController, NSURLSessionDownloadDelegate {
    
    @IBOutlet var progressView: ProgressView!
    @IBOutlet var statusLabel: UILabel!
    @IBOutlet var downloadButton: DownloadButton!
    
    @IBAction func downloadButtonPressed(sender: AnyObject) {
        createDownloadTask()
    }
    
    private var downloadTask: NSURLSessionDownloadTask?

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func createDownloadTask() {
        let downloadRequest = NSMutableURLRequest(URL: NSURL(string: "https://unsplash.com/photos/4aQY2CrXsa8/download")!)
        
        let session = NSURLSession(configuration: NSURLSessionConfiguration.defaultSessionConfiguration(), delegate: self, delegateQueue: NSOperationQueue.mainQueue())
        
        downloadTask = session.downloadTaskWithRequest(downloadRequest)
        downloadTask!.resume()
    }
    
    // MARK: - NSURLSessionDownloadDelegate

    func URLSession(session: NSURLSession, downloadTask: NSURLSessionDownloadTask, didWriteData bytesWritten: Int64, totalBytesWritten: Int64, totalBytesExpectedToWrite: Int64) {
        let progress = Float(totalBytesWritten) / Float(totalBytesExpectedToWrite)
        progressView.animateProgressViewToProgress(progress)
        progressView.updateProgressViewLabelWithProgress(progress * 100)
        progressView.updateProgressViewWith(Float(totalBytesWritten), totalFileSize: Float(totalBytesExpectedToWrite))
    }
    
    
    func URLSession(session: NSURLSession, downloadTask: NSURLSessionDownloadTask, didFinishDownloadingToURL location: NSURL) {
        statusLabel.text = "Download finished"
        
        resetView()
    }
    
    func URLSession(session: NSURLSession, task: NSURLSessionTask, didCompleteWithError error: NSError?) {
        if let _ = error {
            statusLabel.text = "Download failed"
        } else {
            statusLabel.text = "Download finished"
        }
        resetView()
    }
    
    func resetView() {
        downloadButton.setTitle("Start download", forState: .Normal)
        downloadTask!.cancel()
    }
}

