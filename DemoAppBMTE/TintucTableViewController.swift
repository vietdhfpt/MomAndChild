//
//  TintucTableViewController.swift
//  DemoAppBMTE
//
//  Created by Đỗ Việt on 11/22/16.
//  Copyright © 2016 Do Viet. All rights reserved.
//

import UIKit
import Alamofire

class TintucTableViewController: UITableViewController {
    
    var activityIndicator: UIActivityIndicatorView = UIActivityIndicatorView()
    
    let urlAPI = "http://cdyt.azurewebsites.net/News/GetRecentNewsMother"
    
    let parameter = ["Page": 1,"Size": "10"]  as [String : Any]
    
    var arrayTintuc = [Tintuc]()
    
    override func viewDidLoad() {
        
        startActivityIndicator()
        
        super.viewDidLoad()
        
        Alamofire.request(urlAPI, method: .post, parameters: parameter, encoding: JSONEncoding.default, headers: nil).responseJSON { (response) in
            let status = response.response?.statusCode
            
            if status == 200 {
                let json = response.result.value as! [[String: AnyObject]]
                
                for item in json {
                    self.arrayTintuc.append(Tintuc(json: item)!
                    )
                }
                self.stopActivityIndicator()
                self.tableView.reloadData()
                
            }
        }
    }
    
    // MARK: - Table view data source
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arrayTintuc.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CellTinTuc", for: indexPath) as! TintucTableViewCell
        //cell title
        cell.titleTintuc.text = arrayTintuc[indexPath.row].title
        
        //cell images
        let url = URL(string: arrayTintuc[indexPath.row].imageUrls)
        let data = try? Data(contentsOf: url!)
        cell.imageViewTinTuc.image = UIImage(data: data!)
        
        //cell content
        cell.descriptionTintuc.text = arrayTintuc[indexPath.row].description
        
        //cell convert date
        cell.labelDate.text = arrayTintuc[indexPath.row].createdDate
        
        
        return cell
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        let indexPath = tableView.indexPathForSelectedRow
        let detailNewsVc = segue.destination as! DetailNewsVC
        detailNewsVc.titleText = arrayTintuc[(indexPath?.row)!].title
        detailNewsVc.urlHTML = arrayTintuc[(indexPath?.row)!].content
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 175
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


