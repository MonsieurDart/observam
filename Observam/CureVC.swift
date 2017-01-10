//
//  CureVC.swift
//  Observam
//
//  Created by Mathieu Godart on 28/04/2016.
//  Copyright © 2016 Godart. All rights reserved.
//

import UIKit

class CureVC: UITableViewController {

    @IBOutlet var validateBtn: UIButton!
    @IBOutlet var frequencyLbl: UILabel!
    @IBOutlet var timesLbl: UILabel!
    
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



    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        self.validateBtn.hidden = globalIsWizardCompleted
    }



    // MARK: - Table view data source

//    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
//        // #warning Incomplete implementation, return the number of sections
//        return 0
//    }
//
//    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        // #warning Incomplete implementation, return the number of rows
//        return 0
//    }


    override func tableView(tableView: UITableView,
                            willDisplayHeaderView view: UIView,
                                                  forSection section: Int) {
        let header = view as? UITableViewHeaderFooterView
        header?.textLabel?.textColor = globalTintColor()
    }

    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {

        if (indexPath == NSIndexPath(forRow: 1, inSection: 1)) {
            return
        }

        if (indexPath == NSIndexPath(forRow: 0, inSection: 1)) {
            let alert = UIAlertController(title: "Fréquence de prise",
                                          message: nil,
                                          preferredStyle: .ActionSheet)

            alert.addAction(UIAlertAction(title: "Une fois par jour",
                style: .Default, handler: { (action: UIAlertAction) in
                    self.frequencyLbl.text = action.title
            }))
            alert.addAction(UIAlertAction(title: "Deux fois par jour",
                style: .Default, handler: { (action: UIAlertAction) in
                    self.frequencyLbl.text = action.title
            }))
            alert.addAction(UIAlertAction(title: "Trois fois par jour",
                style: .Default, handler: { (action: UIAlertAction) in
                    self.frequencyLbl.text = action.title
            }))
            alert.addAction(UIAlertAction(title: "Quatre fois par jour",
                style: .Default, handler: { (action: UIAlertAction) in
                    self.frequencyLbl.text = action.title
            }))
            alert.addAction(UIAlertAction(title: "Annuler",
                style: .Cancel, handler: { (action: UIAlertAction) in
            }))

            alert.view.tintColor = globalTintColor()

            presentViewController(alert, animated: true, completion:nil)
        }

        tableView.deselectRowAtIndexPath(indexPath, animated: true)
    }

//    @IBAction func unwindToCureVC(sender: UIStoryboardSegue)
//    {
//        let sourceViewController = sender.sourceViewController
//        // Pull any data from the view controller which initiated the unwind segue.
//    }
//
//    override func unwindForSegue(unwindSegue: UIStoryboardSegue, towardsViewController subsequentVC: UIViewController) {
//    }

    /*
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("reuseIdentifier", forIndexPath: indexPath)

        // Configure the cell...

        return cell
    }
    */

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

}
