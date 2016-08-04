//
//  ViewController.swift
//  quotePro
//
//  Created by Viviane Chan on 2016-08-03.
//  Copyright © 2016 LightHouse Labs. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var quoteView:QuoteView!
    
    var quoteObject: Quote!
    
    var image: UIImage!
    
    var randomQuote:String!
    var author:String!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        quoteView = NSBundle.mainBundle().loadNibNamed("QuoteView", owner: self, options: nil)[0] as! QuoteView
        self.view.addSubview(quoteView)
        
    }
    
    
    override func viewDidLayoutSubviews() {
        let frame = CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height - 60)
        quoteView.frame = frame
    }
    
    
    
    // MARK: button actions
    
    // NSURLSession request to get the image
    // set the image property to the fetched image
    
    @IBAction func getImage(sender: UIButton) {
        
        
        let requestURL: NSURL = NSURL(string: "https://unsplash.it/200/300/?random&blur")!
        let urlRequest: NSMutableURLRequest = NSMutableURLRequest(URL: requestURL)
        let session = NSURLSession.sharedSession()
        let task = session.dataTaskWithRequest(urlRequest) {
            (data, response, error) -> Void in
            let httpResponse = response as! NSHTTPURLResponse
            let statusCode = httpResponse.statusCode
            if (statusCode == 200) {
                
                guard let data = data else {
                    return
                }
                
                self.image = UIImage(data: data)
                
                dispatch_async(dispatch_get_main_queue(), {
                    
                    self.quoteView.imageView.image = self.image
                })
            }
            
        }
        task.resume()
    }
    
    
    
    
    //        dispatch_async(dispatch_get_global_queue( DISPATCH_QUEUE_PRIORITY_DEFAULT, 0)) {
    //
    //            let myImage =  UIImage(data: NSData(contentsOfURL: NSURL(string:"https://unsplash.it/200/300/?random&blur")!)!)
    //
    //            dispatch_async(dispatch_get_main_queue()){
    //            self.quoteView.imageView.image = myImage
    ////            self.quote.image = "https://unsplash.it/200/300/?random" // VIV REDO THIS
    //            }
    //        }
    //    }
    
    
    
    
    @IBAction func getQuote(sender: UIButton) {
        
        let requestURL: NSURL = NSURL(string: "http://api.forismatic.com/api/1.0/?method=getQuote&lang=en&format=json")!
        let urlRequest: NSMutableURLRequest = NSMutableURLRequest(URL: requestURL)
        let session = NSURLSession.sharedSession()
        let task = session.dataTaskWithRequest(urlRequest) {
            (data, response, error) -> Void in
            let httpResponse = response as! NSHTTPURLResponse
            let statusCode = httpResponse.statusCode
            if (statusCode == 200) {
                
                do{
                    let json = try NSJSONSerialization.JSONObjectWithData(data!, options:.AllowFragments) as! NSDictionary
                    
                    self.randomQuote = json["quoteText"] as! String
                    self.author = json["quoteAuthor"] as! String
                    dispatch_async(dispatch_get_main_queue(), {
                        self.quoteView.quoteLabel.text = self.randomQuote
                        self.quoteView.sourceLabel.text = self.author
                    })
                }
                catch {
                    print("Error with Json: \(error)")
                }
            }
            
        }
        task.resume()
    }
    
    // add save method back and create the Quote object and set it to the property
    
    @IBAction func save() {
        self.quoteObject = Quote(quote: self.randomQuote, author: self.author, image: self.image)
        self.performSegueWithIdentifier("UnwindSegue", sender: self)
    }
    
    
    
    
    
    
}
