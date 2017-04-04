//
//  CommunicateVC.swift
//  DemoAppBMTE
//
//  Created by Đỗ Việt on 11/24/16.
//  Copyright © 2016 Do Viet. All rights reserved.
//

import UIKit
import Alamofire

class CommunicateVC: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate {

    //labelMenu
    
    @IBOutlet weak var labelLichDatKham: UILabel!
    @IBOutlet weak var labelThongBaoKhac: UILabel!
    
    
    //constraint View Thong Bao
    @IBOutlet weak var containerViewThongBao: UIView!
    @IBOutlet weak var leftConstraintOfViewThongBao: NSLayoutConstraint!
    @IBOutlet weak var rightConstraintOfViewThongBao: NSLayoutConstraint!
    
    //constraint View Lich Kham
    @IBOutlet weak var containerViewLichKham: UIView!
    @IBOutlet weak var leftConstraintViewLichKham: NSLayoutConstraint!
    @IBOutlet weak var rightConstraintOfViewLichKham: NSLayoutConstraint!

    
    @IBOutlet weak var collectionView: UICollectionView!
    
    @IBOutlet weak var ngayLabelHome: UILabel!
    @IBOutlet weak var minLabelHome: UILabel!
    @IBOutlet weak var maxLabelHome: UILabel!
    @IBOutlet weak var imageHome: UIImageView!
    @IBOutlet weak var iconHome: UIImageView!
    @IBOutlet weak var timeHome: UILabel!
    
    var stringURL: String = "http://api.openweathermap.org/data/2.5/forecast/daily?lat=21.028048&lon=105.777301&cnt=10&mode=json&appid=c80a2e47667cedab4873abb8a9fff762"
    
    var activityIndicator: UIActivityIndicatorView = UIActivityIndicatorView()
    
    var dataCommunicate = [DataCommunicate]()
    
    override func viewDidLoad() {
        
        startActivityIndicator()
        
        defaultMenu()
        
        super.viewDidLoad()

        navigationItem.title = "Thông báo"
        Alamofire.request(stringURL, method: .get, parameters: nil, encoding: JSONEncoding.default, headers: nil).responseJSON { (response) in
            if response.response?.statusCode == 200 {
                let json = response.result.value as! [String: AnyObject]
                let list = json["list"] as! [[String: AnyObject]]
                for items in list {
                    self.dataCommunicate.append(DataCommunicate(json: items)!)
                }
                self.ngayLabelHome.text = self.dataCommunicate[0].dt
                self.imageHome.image = UIImage(named: self.dataCommunicate[0].weather[0].description)
                self.minLabelHome.text = self.dataCommunicate[0].temp?.min
                self.maxLabelHome.text = self.dataCommunicate[0].temp?.max
                
                self.stopActivityIndicator()
                self.collectionView.reloadData()
            }
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return dataCommunicate.count - 1
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "collectionViewCell", for: indexPath) as! CommunicateCV
        cell.ngayLabelCV.text = dataCommunicate[indexPath.row + 1].dt
        cell.thangLabel.text = dataCommunicate[indexPath.row + 1].ntn
        cell.minLabelCV.text = dataCommunicate[indexPath.row + 1].temp?.min
        cell.maxLabelCV.text = dataCommunicate[indexPath.row + 1].temp?.max
        cell.imageViewCV.image = UIImage(named: dataCommunicate[indexPath.row + 1].weather[0].main)

        return cell
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
    
    func showLichKham() {
        UIView.animate(withDuration: 0.4){
            
            self.labelLichDatKham.isHidden = false
            self.labelThongBaoKhac.isHidden = true
            
            self.leftConstraintViewLichKham.constant = 0
            self.rightConstraintOfViewLichKham.constant = 0

            self.leftConstraintOfViewThongBao.constant = self.containerViewThongBao.frame.width
            self.rightConstraintOfViewThongBao.constant = -self.containerViewThongBao.frame.width
            
            
            self.view.layoutIfNeeded()
        }
    }
    
    func showThongBao() {
        UIView.animate(withDuration: 0.4) {
            
            self.labelLichDatKham.isHidden = true
            self.labelThongBaoKhac.isHidden = false
            
            self.leftConstraintViewLichKham.constant = -self.containerViewLichKham.frame.width
            self.rightConstraintOfViewLichKham.constant = self.containerViewLichKham.frame.width
            
            self.leftConstraintOfViewThongBao.constant = 0
            self.rightConstraintOfViewThongBao.constant = 0
            
            
            self.view.layoutIfNeeded()
        }
    }
    
    func defaultMenu() {
        
        labelLichDatKham.isHidden = false
        labelThongBaoKhac.isHidden = true
        
        //constraint of ViewLichKham
        self.leftConstraintViewLichKham.constant = 0
        self.rightConstraintOfViewLichKham.constant = 0
        //constraint of ViewThongBao
        self.leftConstraintOfViewThongBao.constant = self.containerViewThongBao.frame.width
        self.rightConstraintOfViewThongBao.constant = -self.containerViewThongBao.frame.width
        
    }

    @IBAction func BtnLichDatKham(_ sender: Any) {
        
        showLichKham()
        
    }
    
    @IBAction func BtnThongBaoKhac(_ sender: Any) {
        
        showThongBao()
        
    }

}
