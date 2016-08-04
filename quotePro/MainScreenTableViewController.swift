//
//  MainScreenTableViewController.swift
//  quotePro
//
//  Created by Viviane Chan on 2016-08-03.
//  Copyright © 2016 LightHouse Labs. All rights reserved.
//

import UIKit

class MainScreenTableViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    var quotesLibrary:[Quote]=[]
    
    @IBOutlet weak var tableView: UITableView!
    
    let viewController = ViewController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
            
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: - Table view data
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.quotesLibrary.count
    }
    
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("Cell", forIndexPath: indexPath) as! MainScreenTableViewCell
        
        let quote = quotesLibrary[indexPath.row]
        
        cell.authorLabel.text = quote.author
        cell.authorLabel.textColor = UIColor .redColor()
        cell.quoteLabel.text = quote.quote
        cell.quoteImage = UIImageView (image: quote.image)
    
        return cell
    }
    
    
    
    
//    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
//        if segue.identifier == "shareQuote" {
//            let shareViewController = segue.destinationViewController as! ShareViewController
//            
//            
//        }
//    }
    
    
    @IBAction func saveQuote(segue: UIStoryboardSegue) {
        
        if let vc = segue.sourceViewController as? ViewController {
            
            self.quotesLibrary.append(vc.quoteObject)
            self.tableView.reloadData()
            
        }
    }
}


/*
 // Override to support conditional editing of the table view.
 override func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
 // Return false if you do not want the specified item to be editable.
 return true
 }
 */

/*
 // Override to support editing the table view.
 override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
 if editingStyle == .Delete {
 // Delete the row from the data source
 tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
 } else if editingStyle == .Insert {
 // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
 }
 }
 */

/*
 // Override to support rearranging the table view.
 override func tableView(tableView: UITableView, moveRowAtIndexPath fromIndexPath: NSIndexPath, toIndexPath: NSIndexPath) {
 
 }
 */

/*
 // Override to support conditional rearranging of the table view.
 override func tableView(tableView: UITableView, canMoveRowAtIndexPath indexPath: NSIndexPath) -> Bool {
 // Return false if you do not want the item to be re-orderable.
 return true
 }
 */

/*
 // MARK: - Navigation
 
 // In a storyboard-based application, you will often want to do a little preparation before navigation
 override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
 // Get the new view controller using segue.destinationViewController.
 // Pass the selected object to the new view controller.
 }
 */




