//
//  WeatherAPIClient.swift
//  niftyFlatironWeather
//
//  Created by Benjamin Su on 10/28/16.
//  Copyright © 2016 Johann Kerr. All rights reserved.
//

import Foundation



struct WeatherAPIClient {
    
    static func getWeatherData(lat: Double, long: Double, completion: @escaping ([String : Any]) -> () ) {
        let urlString = "https://api.darksky.net/forecast/\(clientID)/\(lat),\(long)"
        let url = URL(string: urlString)
        
        guard let unwrappedUrl = url else {  return  }
        
        let session = URLSession.shared
        let dataTask = session.dataTask(with: unwrappedUrl) { (data, response, error) in
            
            guard let uData = data else { return }
            
            do {
                
                let responseJSON = try JSONSerialization.jsonObject(with:uData, options: []) as! [String : Any]
                completion(responseJSON)
                
            } catch {
                
            }
        }
        dataTask.resume()
    }
    
    static func translateTime(time: Double) -> String {
        
        let date = Date(timeIntervalSince1970: time)
        
        let dateFormatter = DateFormatter()
        
        dateFormatter.timeStyle = .short
        dateFormatter.dateStyle = .short
        
        let dateString = dateFormatter.string(from: date)
        
        return dateString
        
    }
    
}











