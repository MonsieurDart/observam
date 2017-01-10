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
            self.takeDrugBtn.setTitle("Traitement déjà pris. Bravo !", for:UIControlState())
            self.takeDrugBtn.isUserInteractionEnabled = false
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
        CareHistory.add("Prise du traitement", atDate: Date())
    }
    
    
    
    @IBAction func takeDrugBtnUp(_ sender: AnyObject) {
        NSLog("Drug taking: btn released")
        drugImgV.layer.removeAllAnimations()
    }



    @IBAction func takeDrugBtnDown(_ sender: AnyObject) {
        NSLog("Drug taking: start");

//        UIView.animateWithDuration(0.8, delay: 0, options: .CurveLinear, animations: {
        UIView.animate(withDuration: 1.1, delay: 0, options: .curveLinear, animations: {
            self.drugImgV.alpha = 1

            }, completion: { (finished) in

                if (finished) {
                    NSLog("Drug taking: done")

                    self.didTakeDrug()

                    self.takeDrugBtn.setTitle("Traitement pris. Bravo !", for:UIControlState())
                    self.takeDrugBtn.isUserInteractionEnabled = false

//                    UIView.animateWithDuration(0.12, animations:
                    UIView.animate(withDuration: 0.12, animations:
                        {
//                            self.drugImgV.transform = CGAffineTransformMakeScale(1.14, 1.14)
                            self.drugImgV.transform = CGAffineTransform(scaleX: 1.3, y: 1.3)

                        }, completion: { (finished) in

                            UIView.animate(withDuration: 0.08, animations:
                                {
                                    self.drugImgV.transform = CGAffineTransform.identity

                                }, completion: { (finished) in

                                    self.performSegue(withIdentifier: "showDrugLeftScreen", sender:nil)
                            })
                    })
                }
                else {
                    NSLog("Drug taking: cancel done")

                    UIView.animate(withDuration: 0.5, animations: {
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
