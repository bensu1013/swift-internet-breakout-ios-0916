//
//  WeatherDataStore.swift
//  niftyFlatironWeather
//
//  Created by Benjamin Su on 10/28/16.
//  Copyright © 2016 Johann Kerr. All rights reserved.
//

import Foundation


class WeatherDataStore {
    static let sharedInstance = WeatherDataStore()
    
    var daily: DailyWeather!
    var hourly: HourlyWeather!
    var today: CurrentWeather!
    
    
    private init() {}
    
    func loadWeatherData(lat: Double, long: Double, completion: @escaping ()->() ) {
        WeatherAPIClient.getWeatherData(lat: lat, long: long) { (data) in
            
            self.today = CurrentWeather(data: data["currently"] as! [String : Any])
            
            self.hourly = HourlyWeather(data: data["hourly"] as! [String : Any])
            
            self.daily = DailyWeather(data: data["daily"] as! [String : Any])
            completion()
        }
        
    }
}





