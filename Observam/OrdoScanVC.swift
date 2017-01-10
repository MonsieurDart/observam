//
//  OrdoScanVC.swift
//  Observam
//
//  Created by Mathieu Godart on 29/04/2016.
//  Copyright © 2016 Godart. All rights reserved.
//

import UIKit
import AVFoundation

class OrdoScanVC: UIViewController {

    @IBOutlet var scanView: UIImageView!

    var session = AVCaptureSession()
    var prevLayer: AVCaptureVideoPreviewLayer? = nil
    var device: AVCaptureDevice? = nil

    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()

        device = AVCaptureDevice.defaultDevice(withMediaType: AVMediaTypeVideo)

        do {
            let input = try AVCaptureDeviceInput(device: device)
            session.addInput(input)

        } catch {
            NSLog("Could not create capture device input.")
            return
        }

//        let output = AVCaptureMetadataOutput()
//        output.setMetadataObjectsDelegate(self, queue:dispatch_get_main_queue())
//        session.addOutput(output)
//
//        output.metadataObjectTypes = output.availableMetadataObjectTypes

        prevLayer = AVCaptureVideoPreviewLayer(session:session)
        prevLayer?.frame = self.scanView.bounds
        prevLayer?.videoGravity = AVLayerVideoGravityResizeAspectFill
        self.scanView.layer.addSublayer(prevLayer!)
    }



    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        session.startRunning()
    }


    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        prevLayer?.frame = self.scanView.bounds
    }


    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }



    // MARK: - Table view data source

//    override func tableView(tableView: UITableView,
//                            willDisplayHeaderView view: UIView,
//                                                  forSection section: Int) {
//        let header = view as? UITableViewHeaderFooterView
//        header?.textLabel?.textColor = globalTintColor()
//    }

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
