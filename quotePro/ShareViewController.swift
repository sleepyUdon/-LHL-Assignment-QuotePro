//
//  ShareViewController.swift
//  quotePro
//
//  Created by Viviane Chan on 2016-08-03.
//  Copyright © 2016 LightHouse Labs. All rights reserved.
//

import UIKit

class ShareViewController: UIViewController {
    
    var quoteView:QuoteView!


    override func viewDidLoad() {
        super.viewDidLoad()

        quoteView = NSBundle.mainBundle().loadNibNamed("QuoteView", owner: self, options: nil)[0] as! QuoteView
        self.view.addSubview(quoteView)
        
//        self.quoteView.quoteLabel.text = self.randomQuote
//        self.quoteView.sourceLabel.text = self.author
//        cell.quoteImage = UIImageView (image: quote.image)


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
