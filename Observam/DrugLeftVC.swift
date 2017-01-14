//
//  DrugLeftVC.swift
//  Observam
//
//  Created by Mathieu Godart on 13/01/2017.
//  Copyright © 2017 Godart. All rights reserved.
//

import UIKit



class DrugLeftVC: UIViewController {



    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }



    @IBAction func yes(sender: AnyObject?) {
        self.performSegue(withIdentifier: "showWhatFeelingScene", sender:nil)
    }



    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
