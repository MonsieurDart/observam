//
//  HistoryVC_Swift.swift
//  Observam
//
//  Created by Mathieu Godart on 25/04/2016.
//  Copyright © 2016 Godart. All rights reserved.
//

import UIKit

class HistoryVC_Swift: UITableViewController {



    @IBOutlet var editBtnItem: UIBarButtonItem!



    // TODO: move those guys to a proper lazy global scope function.

    func relativeDateFormatter() -> NSDateFormatter {
        let relativeDateFormatter = NSDateFormatter();
        relativeDateFormatter.locale = NSLocale.currentLocale();
        relativeDateFormatter.timeStyle = NSDateFormatterStyle.NoStyle;
        relativeDateFormatter.dateStyle = NSDateFormatterStyle.MediumStyle;
        relativeDateFormatter.doesRelativeDateFormatting = true;
        return relativeDateFormatter;
    }

    func timeFormatter() -> NSDateFormatter {
        let timeFormatter = NSDateFormatter();
        timeFormatter.locale = NSLocale.currentLocale();
        timeFormatter.timeStyle = NSDateFormatterStyle.ShortStyle;
        timeFormatter.dateStyle = NSDateFormatterStyle.NoStyle;
        return timeFormatter;
    }



    func globalTintColor() -> UIColor {
        return UIColor(red:31.0/255, green:187.0/255, blue:151.0/255, alpha:1);
    }



    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()

        self.navigationItem.rightBarButtonItem = self.editBtnItem

        CareHistory.add("Un peu fatigué (2/5)", atDate: NSDate())
        CareHistory.add("Prise du traitement", atDate: NSDate(timeIntervalSinceNow:-60))
        CareHistory.add("Prise du traitement", atDate: NSDate(timeIntervalSinceNow:-60*60*24.2))
        CareHistory.add("Oubli du traitement", atDate: NSDate(timeIntervalSinceNow:-60*60*28.6))
        CareHistory.add("Tout va bien", atDate: NSDate(timeIntervalSinceNow:-60*60*28.34))
    }



    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }



    // MARK: - Table view data source



    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return CareHistory.caresGroupedByDay().count
    }


    
    override func tableView(tableView: UITableView,
                            numberOfRowsInSection section: Int) -> Int {
        return CareHistory.caresGroupedByDay()[section].count
    }



    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {

        let cell = tableView.dequeueReusableCellWithIdentifier("historyCell", forIndexPath: indexPath)

        let care = CareHistory.caresGroupedByDay()[indexPath.section][indexPath.row]

//        cell.detailTextLabel?.text = timeFormatter().stringFromDate(care.date)
        cell.detailTextLabel?.text = care.date.toString(dateStyle: .NoStyle, timeStyle: .ShortStyle, doesRelativeDateFormatting: true)
        cell.textLabel?.text = care.title

        return cell
    }



    override func tableView(tableView: UITableView, titleForHeaderInSection section: Int) -> String? {

        let careGroup = CareHistory.caresGroupedByDay()[section]

        return careGroup.first?.date.toString(dateStyle: .ShortStyle, timeStyle: .NoStyle, doesRelativeDateFormatting: true)
    }



    override func tableView(tableView: UITableView,
                            willDisplayHeaderView view: UIView,
                                                  forSection section: Int) {
        let header = view as? UITableViewHeaderFooterView
        header?.textLabel?.textColor = globalTintColor()
    }



    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */



    @IBAction func share(sender: AnyObject) {

        let alert = UIAlertController(title: "Partager votre historique",
                                      message: nil,
                                      preferredStyle: .ActionSheet)

        alert.addAction(UIAlertAction(
            title: "Envoyer à votre médecin…",
            style: .Default, handler: { (action) in return }))

        alert.addAction(UIAlertAction(
            title: "Envoyer à un proche…",
            style: .Default, handler: { (action) in return }))

        alert.addAction(UIAlertAction(
            title: "Annuler",
            style: .Cancel, handler: { (action) in return }))

        alert.view.tintColor = globalTintColor();

        presentViewController(alert, animated: true, completion: nil)
    }


    
}


