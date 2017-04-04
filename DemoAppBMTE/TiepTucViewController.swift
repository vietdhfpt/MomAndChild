//
//  TiepTucViewController.swift
//  DemoAppBMTE
//
//  Created by Đỗ Việt on 11/13/16.
//  Copyright © 2016 Do Viet. All rights reserved.
//

import UIKit

class TiepTucViewController: UIViewController, UIPopoverPresentationControllerDelegate {
    
    @IBOutlet weak var tieptucContrains: NSLayoutConstraint!
    @IBOutlet weak var buttonBaMeMangThai: UIButton!
    @IBOutlet weak var buttonBaMeMoiSinh: UIButton!
    @IBOutlet weak var buttonBaMeNuoiConNho: UIButton!
    
    @IBOutlet weak var valueTuan: UILabel!
    @IBOutlet weak var valueThang: UILabel!
    @IBOutlet weak var valueTuoi: UILabel!
    
    var isCheckButton = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        notificationObserve(observer: self, selector: #selector(handlerRuturnValueTuan), name: NSNotification.Name(rawValue: toggle), object: nil)
        notificationObserve(observer: self, selector: #selector(handlerRuturnValueThang), name: NSNotification.Name(rawValue: toggleThang), object: nil)
        notificationObserve(observer: self, selector: #selector(handlerRuturnValueTuoi), name: NSNotification.Name(rawValue: toggleTuoi), object: nil)
        
        //tieptucContrains.constant = 0.1 * view.frame.height
    }
    
    func notificationObserve(observer: Any , selector: Selector, name: NSNotification.Name, object: Any?) {
        NotificationCenter.default.addObserver(observer, selector: selector, name: name, object: object)
    }
    
    deinit {
        NotificationCenter.default.removeObserver(self)
    }
    
    func handlerRuturnValueTuan(notification: NSNotification){
        let value = notification.object
        valueTuan.text = String(describing: value!) + " Tuần"
    }
    
    func handlerRuturnValueThang(notification: NSNotification){
        let value = notification.object
        valueThang.text = String(describing: value!) + " Tháng"
    }
    
    func handlerRuturnValueTuoi(notification: NSNotification){
        let value = notification.object
        valueTuoi.text = String(describing: value!) + " Tháng"
    }
    
    func restoneState() {
        buttonBaMeMangThai.isSelected = false
        buttonBaMeMoiSinh.isSelected = false
        buttonBaMeNuoiConNho.isSelected = false
    }
    
    @IBAction func clickBaMeMangThai(_ sender: Any) {
        isCheckButton = true
        restoneState()
        buttonBaMeMangThai.isSelected = true
//        number = 1
    }
    
    @IBAction func clickBaMeMoiSinh(_ sender: Any) {
        isCheckButton = true
        restoneState()
        buttonBaMeMoiSinh.isSelected = true
//        number = 2
        
    }
    
    @IBAction func clickBaMeNuoiConNho(_ sender: Any) {
        isCheckButton = true
        restoneState()
        buttonBaMeNuoiConNho.isSelected = true
//        number = 3
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showTuan" {
            let vc = segue.destination as! PopupTuanViewController
            //vc.modalPresentationStyle = .popover
            vc.popoverPresentationController?.delegate = self
            vc.popoverPresentationController?.sourceView = self.view
            vc.popoverPresentationController?.sourceRect = CGRect(x: self.view.bounds.midX, y: self.view.bounds.midY, width: 0, height: 0)
        }
        else if segue.identifier == "showThang" {
            let vc = segue.destination as! PopupThangViewController
            vc.popoverPresentationController?.delegate = self
            vc.popoverPresentationController?.sourceView = self.view
            vc.popoverPresentationController?.sourceRect = CGRect(x: self.view.bounds.midX, y: self.view.bounds.midY, width: 0, height: 0)
        }
        else if segue.identifier == "showTuoi" {
            let vc = segue.destination as! PopupTuoiViewController
            vc.popoverPresentationController?.delegate = self
            vc.popoverPresentationController?.sourceView = self.view
            vc.popoverPresentationController?.sourceRect = CGRect(x: self.view.bounds.midX, y: self.view.bounds.midY, width: 0, height: 0)
        } else if segue.identifier == "showHome" {
//            if isCheckButton == false {
//                //let homeVC = segue.destination as! TrangChuViewController
//                let alert = UIAlertController(title: "Thông báo", message: "Mời bạn chọn thông tin", preferredStyle: UIAlertControllerStyle.alert)
//                alert.addAction(UIAlertAction(title: "Hủy", style: UIAlertActionStyle.default, handler: nil))
//                self.present(alert, animated: true, completion: nil)
//            }
        }
    }
    
    func adaptivePresentationStyle(for controller: UIPresentationController) -> UIModalPresentationStyle {
        return .none
    }
}
