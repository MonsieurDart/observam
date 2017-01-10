//
//  TakeDrugVC.swift
//  Observam
//
//  Created by Mathieu Godart on 03/05/2016.
//  Copyright © 2016 Godart. All rights reserved.
//

import UIKit

class TakeDrugVC: UIViewController {

    @IBOutlet var takeDrugBtn: UIButton!
    @IBOutlet var drugImgV: UIImageView!



    override func viewDidLoad() {
        super.viewDidLoad()

        if (globalDrugAlreadyTaken) {
            self.drugImgV.alpha = 1
            self.takeDrugBtn.setTitle("Traitement déjà pris. Bravo !", forState:.Normal)
            self.takeDrugBtn.userInteractionEnabled = false
        }
        else {
            self.drugImgV.alpha = self.defaultDrugImgAlpha()
        }
    }



    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }



    func defaultDrugImgAlpha() -> CGFloat { return 0.06 }



    func didTakeDrug() {
        CareHistory.add("Prise du traitement", atDate: NSDate())
    }
    
    
    
    @IBAction func takeDrugBtnUp(sender: AnyObject) {
        NSLog("Drug taking: btn released")
        drugImgV.layer.removeAllAnimations()
    }



    @IBAction func takeDrugBtnDown(sender: AnyObject) {
        NSLog("Drug taking: start");

//        UIView.animateWithDuration(0.8, delay: 0, options: .CurveLinear, animations: {
        UIView.animateWithDuration(1.1, delay: 0, options: .CurveLinear, animations: {
            self.drugImgV.alpha = 1

            }, completion: { (finished) in

                if (finished) {
                    NSLog("Drug taking: done")

                    self.didTakeDrug()

                    self.takeDrugBtn.setTitle("Traitement pris. Bravo !", forState:.Normal)
                    self.takeDrugBtn.userInteractionEnabled = false

//                    UIView.animateWithDuration(0.12, animations:
                    UIView.animateWithDuration(0.12, animations:
                        {
//                            self.drugImgV.transform = CGAffineTransformMakeScale(1.14, 1.14)
                            self.drugImgV.transform = CGAffineTransformMakeScale(1.3, 1.3)

                        }, completion: { (finished) in

                            UIView.animateWithDuration(0.08, animations:
                                {
                                    self.drugImgV.transform = CGAffineTransformIdentity

                                }, completion: { (finished) in

                                    self.performSegueWithIdentifier("showDrugLeftScreen", sender:nil)
                            })
                    })
                }
                else {
                    NSLog("Drug taking: cancel done")

                    UIView.animateWithDuration(0.5, animations: {
                        self.drugImgV.alpha = self.defaultDrugImgAlpha()
                    })
                }
        })
    }


    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
