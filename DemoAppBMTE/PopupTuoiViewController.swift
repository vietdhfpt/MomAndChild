//
//  PopupTuoiViewController.swift
//  DemoAppBMTE
//
//  Created by Đỗ Việt on 11/14/16.
//  Copyright © 2016 Do Viet. All rights reserved.
//

import UIKit

let toggleTuoi = "NotificationAges"

class PopupTuoiViewController: UIViewController,  UIPickerViewDelegate, UIPickerViewDataSource {

    @IBOutlet weak var pickerViewTuoi: UIPickerView!
    
    var pickDataSource = [Int]()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        for var i in 0...36 {
            pickDataSource.append(i)
            i += 1
        }
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func XongBtn(_ sender: Any) {
        
        self.dismiss(animated: true, completion: nil)
        let selectedPickerView = pickerViewTuoi.selectedRow(inComponent: 0)
        
        NotificationCenter.default.post(name: NSNotification.Name(toggleTuoi), object: pickDataSource[selectedPickerView])
        
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
