//
//  WhatFeelingVC.swift
//  Observam
//
//  Created by Mathieu Godart on 09/05/2016.
//  Copyright © 2016 Godart. All rights reserved.
//

import UIKit

class WhatFeelingVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func good(_ sender: AnyObject) {
        CareHistory.add("Tout va bien", atDate: Date())
        self.navigationController?.popToRootViewController(animated: true)
    }

    @IBAction func goodOrBad(_ sender: AnyObject) {
        performSegue(withIdentifier: "showSymptomsScene", sender: nil)
    }

    @IBAction func bad(_ sender: AnyObject) {
        performSegue(withIdentifier: "showSymptomsScene", sender: nil)
    }

//    - (IBAction)bad:(id)sender {
//    [self performSegueWithIdentifier:@"showSymptomsScene" sender:nil];
//    }
//
//    - (IBAction)goodOrBad:(id)sender {
//    [self performSegueWithIdentifier:@"showSymptomsScene" sender:nil];
//    }
//
//    - (IBAction)good:(id)sender {
//
//    CareHistory.add("Tout va bien", atDate: NSDate())
//
//    [self.navigationController popToRootViewControllerAnimated:YES];
//    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
