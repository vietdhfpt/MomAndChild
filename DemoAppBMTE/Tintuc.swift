//
//  Tintuc.swift
//  DemoAppBMTE
//
//  Created by Đỗ Việt on 11/21/16.
//  Copyright © 2016 Do Viet. All rights reserved.
//

import Foundation

class Tintuc {
    var title: String
    var imageUrls: String
    var description: String
    var content: String
    var createdDate: String
    
    init?(json: [String: AnyObject]) {
        guard let title = json["Title"] as? String else { return nil }
        self.title = title
        
        guard let imageUrls = json["ImageUrls"] as? [String] else { return nil }
        self.imageUrls = imageUrls[0]

        guard let description = json["Description"] else { return nil }
        self.description = description as! String
        
        guard let content = json["Content"] else { return nil }
        self.content = content as! String
        
        //convert date type int to date
        guard let createdDated = json["CreatedDate"] as? Double else { return nil }
        let date = Date.init(timeIntervalSince1970: createdDated)
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "EEEE dd/MM/yyyy HH:mm:a"
        let dateString = dateFormatter.string(from: date)
        self.createdDate = dateString
        //print(dateString)
        
//        let date1 = Date.init(timeIntervalSince1970: 1479960000)
//        let dateString1 = dateFormatter.string(from: date1)
//        print(dateString1)
    }
}
