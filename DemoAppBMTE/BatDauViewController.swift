//
//  BatDauViewController.swift
//  DemoAppBMTE
//
//  Created by Đỗ Việt on 11/12/16.
//  Copyright © 2016 Do Viet. All rights reserved.
//

import UIKit

class BatDauViewController: UIViewController {

    @IBOutlet weak var bottomConstraintOfButtonBatDauNgay: NSLayoutConstraint!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        //bottomConstraintOfButtonBatDauNgay.constant = 0.1 * view.frame.height
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func BatDauClick(_ sender: UIButton) {
        
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
