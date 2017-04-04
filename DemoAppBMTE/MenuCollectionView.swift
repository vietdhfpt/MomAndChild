//
//  MenuCollectionView.swift
//  DemoAppBMTE
//
//  Created by Đỗ Việt on 11/21/16.
//  Copyright © 2016 Do Viet. All rights reserved.
//

import UIKit
import Alamofire

class MenuCollectionView: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
        
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 2
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 3
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        var cell = UICollectionViewCell()
        if indexPath.section == 0 {
            if indexPath.row == 0 {
                cell = collectionView.dequeueReusableCell(withReuseIdentifier: "tintucItem", for: indexPath)
            } else if indexPath.row == 1 {
                cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ghichuItems", for: indexPath)
            } else if indexPath.row == 2 {
                cell = collectionView.dequeueReusableCell(withReuseIdentifier: "thongbaoItem", for: indexPath)
            }
        } else if indexPath.section == 1 {
            if indexPath.row == 0 {
                cell = collectionView.dequeueReusableCell(withReuseIdentifier: "tuvanItem", for: indexPath)
            } else if indexPath.row == 1 {
                cell = collectionView.dequeueReusableCell(withReuseIdentifier: "phongkhamItem", for: indexPath)
            } else if indexPath.row == 2 {
                cell = collectionView.dequeueReusableCell(withReuseIdentifier: "dieuchinhItem", for: indexPath)
            }
        }
        return cell
    }
}
