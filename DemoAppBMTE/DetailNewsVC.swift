//
//  DetailNewsVC.swift
//  DemoAppBMTE
//
//  Created by Đỗ Việt on 11/22/16.
//  Copyright © 2016 Do Viet. All rights reserved.
//

import UIKit

class DetailNewsVC: UIViewController, UIWebViewDelegate {
    
    var activityIndicator: UIActivityIndicatorView = UIActivityIndicatorView()
    
    @IBOutlet weak var webView: UIWebView!
    var urlHTML: String!
    var titleText = String()
    
    override func viewDidLoad() {
        
        startActivityIndicator()
        super.viewDidLoad()

        //read url JSON from Tintuc
        navigationItem.title = titleText
        let url = URL(string: urlHTML)
        
        stopActivityIndicator()
        webView.loadHTMLString(urlHTML, baseURL: url)
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func startActivityIndicator() {
        activityIndicator.color = UIColor .gray
        activityIndicator.frame = CGRect(x: 0.0, y: 0.0, width: 10.0, height: 10.0)
        activityIndicator.center = self.view.center
        self.view.addSubview(activityIndicator)
        activityIndicator.bringSubview(toFront: self.view)
        activityIndicator.startAnimating()
    }
    
    func stopActivityIndicator() {
        self.activityIndicator.stopAnimating()
        self.activityIndicator.hidesWhenStopped = true
    }
    
}
