//
//  DrugScanVC.swift
//  Observam
//
//  Created by Mathieu Godart on 29/04/2016.
//  Copyright © 2016 Godart. All rights reserved.
//

import UIKit
import AVFoundation

class DrugScanVC: UITableViewController, AVCaptureMetadataOutputObjectsDelegate {

    @IBOutlet var barcodeView: UIView!

    var session = AVCaptureSession()
    var prevLayer: AVCaptureVideoPreviewLayer? = nil
    var device: AVCaptureDevice? = nil



    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()

        device = AVCaptureDevice.defaultDeviceWithMediaType(AVMediaTypeVideo)

        do {
            let input = try AVCaptureDeviceInput(device: device)
            session.addInput(input)

        } catch {
            NSLog("Could not create capture device input.")
            return
        }

        let output = AVCaptureMetadataOutput()
        output.setMetadataObjectsDelegate(self, queue:dispatch_get_main_queue())
        session.addOutput(output)

        output.metadataObjectTypes = output.availableMetadataObjectTypes

        prevLayer = AVCaptureVideoPreviewLayer(session:session)
        prevLayer?.frame = self.barcodeView.bounds
        prevLayer?.videoGravity = AVLayerVideoGravityResizeAspectFill
        self.barcodeView.layer.addSublayer(prevLayer!)
    }



    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        session.startRunning()
    }



    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        prevLayer?.frame = self.barcodeView.bounds
    }

    

    func captureOutput(captureOutput: AVCaptureOutput!, didOutputMetadataObjects metadataObjects: [AnyObject]!, fromConnection connection: AVCaptureConnection!) {
        
        NSLog("Found something!")

//        var highlightViewRect = CGRectZero
//        var barCodeObject : AVMetadataMachineReadableCodeObject? = nil
        var detectionString: String? = nil
        let barcodeTypes = [AVMetadataObjectTypeUPCECode, AVMetadataObjectTypeCode39Code,
                            AVMetadataObjectTypeCode39Mod43Code, AVMetadataObjectTypeEAN13Code,
                            AVMetadataObjectTypeEAN8Code, AVMetadataObjectTypeCode93Code,
                            AVMetadataObjectTypeCode128Code, AVMetadataObjectTypePDF417Code,
                            AVMetadataObjectTypeQRCode, AVMetadataObjectTypeAztecCode]

        for data in metadataObjects {
            let metaData = data as? AVMetadataObject
            for barcodeType in barcodeTypes {
                if (metaData?.type == barcodeType) {
//                    barCodeObject = (AVMetadataMachineReadableCodeObject *)[prevLayer transformedMetadataObjectForMetadataObject:(AVMetadataMachineReadableCodeObject *)metadata]
//                    highlightViewRect = barCodeObject.bounds
                    let metaDataCode = metaData as? AVMetadataMachineReadableCodeObject
                    detectionString = metaDataCode?.stringValue

                    if let detectionStringSafe = detectionString {

                        NSLog("Found: " + detectionStringSafe + " in " + barcodeType)

                        if ("3463947" == detectionStringSafe &&
                            AVMetadataObjectTypeCode39Code == barcodeType) ||
                            ("5346394700137200" == detectionStringSafe &&
                            AVMetadataObjectTypeCode128Code == barcodeType) ||
                            self.title != "Votre médicament" { // Dirty dirty hack!!!

                            session.stopRunning()
                            performSegueWithIdentifier("showNextScene", sender: self)
                            return
                        }
                    }
                }
            }

//            if let detectionStringSafe = detectionString {
////                _label.text = detectionString
//                NSLog("Found: " + detectionStringSafe)
//                break
//            }
//            else
//            _label.text = @"(none)"
        }
        
//        _highlightView.frame = highlightViewRect

//        for data in metadataObjects {
//            let metaData = data as? AVMetadataObject
//            let transformed = previewLayer?.transformedMetadataObjectForMetadataObject(metaData) as? AVMetadataMachineReadableCodeObject
//            if let unwraped = transformed {
//                identifiedBorder?.frame = unwraped.bounds
//                identifiedBorder?.hidden = false
//                let identifiedCorners = self.translatePoints(unwraped.corners, fromView: self.view, toView: self.identifiedBorder!)
//                identifiedBorder?.drawBorder(identifiedCorners)
//                self.identifiedBorder?.hidden = false
//                self.startTimer()
//            }
//        }
    }



    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }



    override func tableView(tableView: UITableView,
                            willDisplayHeaderView view: UIView,
                                                  forSection section: Int) {
        let header = view as? UITableViewHeaderFooterView
        header?.textLabel?.textColor = globalTintColor()
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
