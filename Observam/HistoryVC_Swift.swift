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

    func relativeDateFormatter() -> DateFormatter {
        let relativeDateFormatter = DateFormatter();
        relativeDateFormatter.locale = Locale.current;
        relativeDateFormatter.timeStyle = DateFormatter.Style.none;
        relativeDateFormatter.dateStyle = DateFormatter.Style.medium;
        relativeDateFormatter.doesRelativeDateFormatting = true;
        return relativeDateFormatter;
    }

    func timeFormatter() -> DateFormatter {
        let timeFormatter = DateFormatter();
        timeFormatter.locale = Locale.current;
        timeFormatter.timeStyle = DateFormatter.Style.short;
        timeFormatter.dateStyle = DateFormatter.Style.none;
        return timeFormatter;
    }



    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()

        self.navigationItem.rightBarButtonItem = self.editBtnItem
    }



    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        tableView.reloadData()
    }



    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }



    // MARK: - Table view data source



    override func numberOfSections(in tableView: UITableView) -> Int {
        return CareHistory.caresGroupedByDay().count
    }


    
    override func tableView(_ tableView: UITableView,
                            numberOfRowsInSection section: Int) -> Int {
        return CareHistory.caresGroupedByDay()[section].count
    }



    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        let cell = tableView.dequeueReusableCell(withIdentifier: "historyCell", for: indexPath)

        let groupedCares = CareHistory.caresGroupedByDay()
        if indexPath.section >= groupedCares.count ||
            indexPath.row >= groupedCares[indexPath.section].count {
            cell.detailTextLabel?.text = ""
            cell.textLabel?.text = ""
            return cell
        }

        let care = groupedCares[indexPath.section][indexPath.row]

//        cell.detailTextLabel?.text = timeFormatter().stringFromDate(care.date)
        cell.detailTextLabel?.text = care.date.toString(dateStyle: .none, timeStyle: .short, doesRelativeDateFormatting: true)
        cell.textLabel?.text = care.title

        return cell
    }



    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {

        let careGroup = CareHistory.caresGroupedByDay()[section]

        return careGroup.first?.date.toString(dateStyle: .short, timeStyle: .none, doesRelativeDateFormatting: true)
    }



    override func tableView(_ tableView: UITableView,
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



    @IBAction func share(_ sender: AnyObject) {

        let alert = UIAlertController(title: "Partager votre historique",
                                      message: nil,
                                      preferredStyle: .actionSheet)

        alert.addAction(UIAlertAction(
            title: "Envoyer à votre médecin…",
            style: .default, handler: { (action) in return }))

        alert.addAction(UIAlertAction(
            title: "Envoyer à un proche…",
            style: .default, handler: { (action) in return }))

        alert.addAction(UIAlertAction(
            title: "Annuler",
            style: .cancel, handler: { (action) in return }))

        alert.view.tintColor = globalTintColor();

        present(alert, animated: true, completion: nil)
    }


    
}


