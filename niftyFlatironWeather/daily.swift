//
//  daily.swift
//  niftyFlatironWeather
//
//  Created by Benjamin Su on 10/28/16.
//  Copyright © 2016 Johann Kerr. All rights reserved.
//

import Foundation




class HourlyWeather {
    
    var hourlyForecasts: [CurrentWeather] = []
    var summary: String = ""
    
    
    init(data: [String : Any]) {
        self.summary = data["summary"] as! String
        
        for item in data["data"] as! Array<[ String : Any ]> {
            hourlyForecasts.append(CurrentWeather(data: item))
        }
    }
}

class DailyWeather {
    
    var dailyForecasts: [CurrentWeather] = []
    var summary: String = ""
    
    init(data: [String : Any ]) {
        self.summary = data["summary"] as! String
        
        for item in data["data"] as! Array< [ String : Any ] > {
            
            dailyForecasts.append(CurrentWeather(data: item, isDaily: true))
        }
    }
}


class CurrentWeather {
    
    var summary: String = ""
    var temperature: Double = 0.0
    var humidity: Double = 0.0
    var time: Double = 0.0
    init(data: [String : Any], isDaily: Bool = false) {
        self.summary = data["summary"] as! String
        self.humidity = data["humidity"] as! Double
        self.time = data["time"] as! Double
        
        if isDaily {
            self.temperature = data["temperatureMax"] as! Double
        } else {
            self.temperature = data["temperature"] as! Double
        }
    }
    

    
    
}











