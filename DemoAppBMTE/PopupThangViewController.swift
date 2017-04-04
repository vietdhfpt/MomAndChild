//
//  PopupThangViewController.swift
//  DemoAppBMTE
//
//  Created by Đỗ Việt on 11/14/16.
//  Copyright © 2016 Do Viet. All rights reserved.
//

import UIKit

class PopupThangViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {

    @IBOutlet weak var pickerViewThang: UIPickerView!
    
    let pickDataSource = ["January","February","March","April","May","June","July","August","September","October","November","December"]
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func XongBtn(_ sender: Any) {
        
        self.dismiss(animated: true, completion: nil)
        let selectedPickerView = pickerViewThang.selectedRow(inComponent: 0)
        // share notification
        NotificationCenter.default.post(name: NSNotification.Name(rawValue: toggleThang), object: pickDataSource[selectedPickerView])
        
    }
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return pickDataSource.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return pickDataSource[row]
    }

    //change style of pickerView
    func pickerView(_ pickerView: UIPickerView, viewForRow row: Int, forComponent component: Int, reusing view: UIView?) -> UIView {
        let pickerLabel = UILabel()
        pickerLabel.textColor = UIColor.red
        pickerLabel.text = String(pickDataSource[row])
        pickerLabel.font = UIFont(name: pickerLabel.font.fontName, size: 28)
        //pickerLabel.font = UIFont(name: "Arial-BoldMT", size: 15) // In this use your custom font
        pickerLabel.textAlignment = NSTextAlignment.center
        return pickerLabel
    }
    
}

let toggleThang = "NotificationMounths"
