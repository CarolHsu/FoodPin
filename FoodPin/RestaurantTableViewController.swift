//  FoodPin
//
//  Created by Hsu Carol on 2015/2/7.
//  Copyright (c) 2015年 Hsu Carol. All rights reserved.
//

import UIKit

class RestaurantTableViewController: UITableViewController {
    var restaurantNames = ["Cafe Deadend", "Homei", "Teakha", "Cafe Loisl", "Petite Oyster", "For Kee Restaurant", "Po's Atelier", "Bourke Street Bakery", "Haigh’s Chocolate", "Palomino Espresso", "Upstate", "Traif", "Graham Avenue Meats And Deli", "Waffle & Wolf", "Five Leaves", "Cafe Lore", "Confessional", "Barrafina", "Donostia", "Royal Oak", "CASK Pub and Kitchen"]
    var restaurantImages = ["cafedeadend.jpg", "homei.jpg", "teakha.jpg", "cafeloisl.jpg", "petiteoyster.jpg", "forkeerestaurant.jpg", "posatelier.jpg", "bourkestreetbakery.jpg", "haighschocolate.jpg", "palominoespresso.jpg", "upstate.jpg", "traif.jpg", "grahamavenuemeats.jpg", "wafflewolf.jpg", "fiveleaves.jpg", "cafelore.jpg", "confessional.jpg", "barrafina.jpg", "donostia.jpg", "royaloak.jpg", "thaicafe.jpg"]
    var restaurantLocations = ["Hong Kong", "Hong Kong", "Hong Kong", "Hong Kong", "Hong Kong", "Hong Kong", "Hong Kong", "Sydney", "Sydney", "New York", "New York", "New York", "New York", "New York", "New York", "New York", "London", "London", "London", "London", "London"]
    var restaurantTypes = ["Coffee & Tea Shop", "Cafe", "Tea House", "Austrian Causual Drink", "French", "Bakery", "Bakery", "Chocolate", "Cafe", "American Sea Food", "American", "Breakfast & Brunch", "Coffee & Tea", "Coffee & Tea", "Latin American", "Spanish", "Spanish", "Spanish", "British", "Thai", "Thai"]
    var restaurantIsVisited = [Bool](count: 21, repeatedValue: false)
                                                                                                                                                                                                                                            
    override func prefersStatusBarHidden() -> Bool {
        return true
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        // #warning Potentially incomplete method implementation.
        // Return the number of sections.
        return 1
    }
    
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        let optionMenu = UIAlertController(title: nil, message: "What do you want to do?", preferredStyle: .ActionSheet)
        let cancelAction = UIAlertAction(title: "Cancel", style: .Cancel, handler: nil)
        let callActionHandler = { (action: UIAlertAction!) -> Void in
            let alertMessage = UIAlertController(title: "Service Unavailable", message: "Sorry, the call feature is not avaiable yet. Please retry later", preferredStyle: .Alert)
            alertMessage.addAction(UIAlertAction(title: "OK", style: .Default, handler: nil))
            self.presentViewController(alertMessage, animated: true, completion: nil) }
        let callAction = UIAlertAction(title: "Call" + "123-000-\(indexPath.row)", style: .Default, handler: callActionHandler)
        let isVisitedAction = UIAlertAction(title: "I've been here", style: .Default, handler: {
            (action: UIAlertAction!) -> Void in
            let cell = tableView.cellForRowAtIndexPath(indexPath) as CustomTableViewCell
            cell.isVisitedImageView.hidden = false
            self.restaurantIsVisited[indexPath.row] = true
        })
        let notVisitedAction = UIAlertAction(title: "I've not been here", style: .Default, handler: {
            (action: UIAlertAction!) -> Void in
            let cell = tableView.cellForRowAtIndexPath(indexPath) as CustomTableViewCell
            cell.isVisitedImageView.hidden = true
            self.restaurantIsVisited[indexPath.row] = false
        })
        
        optionMenu.addAction(callAction)
        optionMenu.addAction(cancelAction)
        if restaurantIsVisited[indexPath.row] {
            optionMenu.addAction(notVisitedAction)
        } else {
            optionMenu.addAction(isVisitedAction)
        }
        
        self.presentViewController(optionMenu, animated: true, completion: nil)
        
        tableView.deselectRowAtIndexPath(indexPath, animated: false)
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete method implementation.
        // Return the number of rows in the section.
        return self.restaurantNames.count
    }

    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cellIdentifier = "Cell"
        let cell = tableView.dequeueReusableCellWithIdentifier(cellIdentifier, forIndexPath: indexPath) as CustomTableViewCell

        // Configure the cell...
        cell.nameLabel?.text = restaurantNames[indexPath.row]
        cell.locationLabel?.text = restaurantLocations[indexPath.row]
        cell.typeLabel?.text = restaurantTypes[indexPath.row]
        cell.thumbnailImageView?.image = UIImage(named: restaurantImages[indexPath.row])
        cell.thumbnailImageView.layer.cornerRadius = cell.thumbnailImageView.frame.size.width / 2
        cell.thumbnailImageView.clipsToBounds = true
        cell.isVisitedImageView?.image = UIImage(named: "heart")
        cell.isVisitedImageView.hidden = !restaurantIsVisited[indexPath.row]

        return cell
    }

    /*
    // Override to support conditional editing of the table view.
    override func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return NO if you do not want the specified item to be editable.
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
        // Return NO if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using [segue destinationViewController].
        // Pass the selected object to the new view controller.
    }
    */

}
