//
//  YouAndDoctorVC.swift
//  Observam
//
//  Created by Mathieu Godart on 28/04/2016.
//  Copyright © 2016 Godart. All rights reserved.
//

import UIKit

var name: String?
var gender: String?
var age: String?
var docName: String?
var docEmail: String?



class YouAndDoctorVC: UITableViewController {


    @IBOutlet var validateBtn: UIButton!

    @IBOutlet var nameLbl: UILabel!
    @IBOutlet var genderLbl: UILabel!
    @IBOutlet var ageLbl: UILabel!

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
//        navigationController?.setNavigationBarHidden(false, animated: true)

        nameLbl.text = name
        genderLbl.text = gender
        ageLbl.text = age
        tableView.reloadData()
    }



    override func tableView(tableView: UITableView,
                            willDisplayHeaderView view: UIView,
                                                  forSection section: Int) {
        let header = view as? UITableViewHeaderFooterView
        header?.textLabel?.textColor = globalTintColor()
    }

//    override func viewDidAppear(animated: Bool) {
//        super.viewDidAppear(animated)
//        self.navigationController?.setNavigationBarHidden(false, animated: true)
//    }

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



    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {

        tableView.deselectRowAtIndexPath(indexPath, animated: true)

        let title = self.tableView(tableView, cellForRowAtIndexPath: indexPath).textLabel?.text
        let editedTxtLabel = self.tableView(tableView, cellForRowAtIndexPath: indexPath).detailTextLabel
        var defaultText = editedTxtLabel?.text

        switch indexPath {
        case NSIndexPath(forRow: 0, inSection: 0):
            queryText(defaultText, title: "Quel est votre nom ?") {
                name = $0
                editedTxtLabel?.text = name
                tableView.reloadData()
            }
            return
        case NSIndexPath(forRow: 1, inSection: 0):
            gender = (gender == "Femme") ? "Homme" : "Femme"
            editedTxtLabel?.text = gender
            tableView.reloadData()
            return
        case NSIndexPath(forRow: 2, inSection: 0):
//            defaultText = "\(Int(editedTxtLabel?.text ?? ""))"
            let ans = " ans"
            defaultText = defaultText?.stringByReplacingOccurrencesOfString(ans, withString: "")
            queryText(defaultText, title: "Quel est votre âge ?", type: .NumberPad) {
                age = $0?.stringByAppendingString(ans)
                editedTxtLabel?.text = age
                tableView.reloadData()
            }
            return
        default: break
        }

        queryText(defaultText, title: title) {
            editedTxtLabel?.text = $0
            tableView.reloadData()
        }
    }



    func queryText(defaultText: String?, title: String?, type: UIKeyboardType = .Default, completion: ((String?) -> Void)) {
        let alert = UIAlertController(title: title, message: nil, preferredStyle: .Alert)
        alert.addTextFieldWithConfigurationHandler {
            $0.text = defaultText
            $0.keyboardType = type
        }
        alert.addAction(UIAlertAction(title: "OK", style: .Default) { (action) in
            completion(alert.textFields?.first?.text) })
        presentViewController(alert, animated: true, completion: nil)
    }

    
    
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
