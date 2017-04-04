//
//  PopupTuanViewController.swift
//  DemoAppBMTE
//
//  Created by Đỗ Việt on 11/13/16.
//  Copyright © 2016 Do Viet. All rights reserved.
//

import UIKit

let toggle = "NotificationWeeks"

class PopupTuanViewController: UIViewController, UIPickerViewDataSource, UIPickerViewDelegate {

    @IBOutlet weak var pickerView: UIPickerView!
    
    var pickDataSource = [Int]()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.pickerView.delegate = self
        self.pickerView.dataSource = self
        for var i in 1...40 {
            pickDataSource.append(i)
            i += 1
        }
//        var i = 1
//        while(i < 40) {
//            pickDataSource.append(i)
//            i += 2
//        }
//        for value in pickDataSource {
//            print(value)
//        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func Xongbtn(_ sender: Any) {
        
        self.dismiss(animated: true, completion: nil)
        
        //get value of pickerView
        let selectedPickerView = pickerView.selectedRow(inComponent: 0)
        
        //send value key toggle
        NotificationCenter.default.post(name: NSNotification.Name.init(toggle), object: pickDataSource[selectedPickerView])
  
    }

    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return pickDataSource.count
    }

    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return String(pickDataSource[row])
    }
    
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
