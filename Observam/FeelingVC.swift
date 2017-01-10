//
//  FeelingVC.swift
//  Observam
//
//  Created by Mathieu Godart on 08/05/2016.
//  Copyright © 2016 Godart. All rights reserved.
//

import UIKit

class FeelingVC: UIViewController, UITextViewDelegate {

    @IBOutlet var textView: UITextView!



    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }



    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        textView.becomeFirstResponder()
    }



    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }



    func textView(_ textView: UITextView, shouldChangeTextIn range: NSRange, replacementText text: String) -> Bool {

        if (text == "\n") {
            CareHistory.add("Un peu fatigué (3/5)", atDate: Date())
            self.navigationController?.popToRootViewController(animated: true)
            return false
        }
        return true
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
