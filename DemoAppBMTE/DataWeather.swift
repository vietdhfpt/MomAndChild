//
//  DataWeather.swift
//  DemoAppBMTE
//
//  Created by Đỗ Việt on 11/24/16.
//  Copyright © 2016 Do Viet. All rights reserved.
//

import Foundation

class DataWeather {
    
    var id: Int
    var main: String
    var description: String
    var icon: String
    
    init?(json: [String: AnyObject]) {
        guard let id = json["id"] as? Int else { return nil }
        self.id = id
        
        guard let main = json["main"] as? String else { return nil }
        self.main = main
        
        guard let description = json["description"] as? String else { return nil }
        self.description = description
        
        guard let icon = json["icon"] as? String else { return nil }
        self.icon = icon
    }
    
}
