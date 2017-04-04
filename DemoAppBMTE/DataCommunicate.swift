//
//  DataCommunicate.swift
//  DemoAppBMTE
//
//  Created by Đỗ Việt on 11/24/16.
//  Copyright © 2016 Do Viet. All rights reserved.
//

import Foundation

class DataCommunicate {
    
    var dt: String
    var ntn: String
    var hour: String
    var temp: DataTemp?
    var weather: [DataWeather] = []
    
    init?(json: [String: AnyObject]) {
        guard let dt = json["dt"] as? Double else { return nil }
        let date = Date.init(timeIntervalSince1970: dt)
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "EEEE"
        let dateString = dateFormatter.string(from: date)
        self.dt = dateString
        
        dateFormatter.dateFormat = "dd/MM/yyyy"
        let dateString1 = dateFormatter.string(from: date)
        self.ntn = dateString1
        //print(ntn)
        
        dateFormatter.dateFormat = "HH:mm:a"
        let dateString2 = dateFormatter.string(from: date)
        self.hour = dateString2
        print(hour)
        
        guard let temp = json["temp"] as? [String: AnyObject] else { return nil }
        self.temp = DataTemp(json: temp)
        
        guard let weathers = json["weather"] as? [[String: AnyObject]] else { return nil }
        for items in weathers {
            weather.append(DataWeather(json: items)!)
        }
        
    }
}
