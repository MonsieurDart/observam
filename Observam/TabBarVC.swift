//
//  TabBarVC.swift
//  Observam
//
//  Created by Mathieu Godart on 29/04/2016.
//  Copyright © 2016 Godart. All rights reserved.
//

import UIKit

class TabBarVC: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        createCareHistory()
    }



    func createCareHistory() {
        let shift = 16.0
        CareHistory.add("Tout va bien", atDate: Date(timeIntervalSinceNow:-60*60*(-8+shift)+2))
        CareHistory.add("Prise du traitement", atDate: Date(timeIntervalSinceNow:-60*60*(-8+shift)))
        CareHistory.add("Problèmes digestifs (1/5)",        atDate: Date(timeIntervalSinceNow:-60*60*(6.30+shift)))
        CareHistory.add("Prise du traitement", atDate: Date(timeIntervalSinceNow:-60*60*(6.34+shift)))
        CareHistory.add("Tout va bien",        atDate: Date(timeIntervalSinceNow:-60*60*(16.23+shift)))
        CareHistory.add("Prise du traitement", atDate: Date(timeIntervalSinceNow:-60*60*(16.24+shift)))
        CareHistory.add("Oubli du traitement", atDate: Date(timeIntervalSinceNow:-60*60*(36.6+shift)))
        CareHistory.add("Assez fatigué (4/5)", atDate: Date(timeIntervalSinceNow:-60*60*(44.30+shift)))
        CareHistory.add("Prise du traitement", atDate: Date(timeIntervalSinceNow:-60*60*(44.2+shift)))
        CareHistory.add("Tout va bien",        atDate: Date(timeIntervalSinceNow:-60*60*(48.34+shift)))
    }


    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)

        if (!globalIsWizardCompleted) {
            performSegue(withIdentifier: "showWizard", sender: self)
        }
    }
//    override func viewWillAppear(animated: Bool) {
//        super.viewWillAppear(animated)
//
//        if (!globalIsWizardCompleted) {
//            performSegueWithIdentifier("showWizard", sender: self)
//        }
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
