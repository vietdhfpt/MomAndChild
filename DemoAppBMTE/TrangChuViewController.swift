//
//  TrangChuViewController.swift
//  DemoAppBMTE
//
//  Created by Đỗ Việt on 11/15/16.
//  Copyright © 2016 Do Viet. All rights reserved.
//

import UIKit
import Alamofire

class TrangChuViewController: UITableViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //addShadowToBar()
    }
    
    func addShadowToBar() {
        let shadowView = UIView(frame: self.navigationController!.navigationBar.frame)
        shadowView.backgroundColor = UIColor.gray
        shadowView.layer.masksToBounds = false
        shadowView.layer.shadowOpacity = 0.4 // your opacity
        shadowView.layer.shadowOffset = CGSize(width: 0, height: 2) // your offset
        shadowView.layer.shadowRadius =  4 //your radius
        self.view.addSubview(shadowView)
    }

}
