//
//  DataTemp.swift
//  DemoAppBMTE
//
//  Created by Đỗ Việt on 11/24/16.
//  Copyright © 2016 Do Viet. All rights reserved.
//

import Foundation

class DataTemp {
    
    var day: String
    var min: String
    var max: String
    var night: String
    var eve: String
    var morn: String
    
    init?(json: [String: AnyObject]) {
        guard let day = json["day"] as? Double else { return nil }
        self.day = String(day)
        
        guard let kelvinTemp = json["min"] as? Double else { return nil }
        let celsiusTemp = kelvinTemp - 273.15
        self.min = String(format: "%.0f", celsiusTemp) + "˚C"
        
        guard let kelvinTempMax = json["max"] as? Double else { return nil }
        let celsiusTempMax = kelvinTempMax - 273.15
        self.max = String(format: "%.0f", celsiusTempMax) + "˚C"
        
        guard let night = json["night"] as? Double else { return nil }
        self.night = String(night)
        
        guard let eve = json["eve"] as? Double else { return nil }
        self.eve = String(eve)
        
        guard let morn = json["morn"] as? Double else { return nil }
        self.morn = String(morn)
        
    }
}
