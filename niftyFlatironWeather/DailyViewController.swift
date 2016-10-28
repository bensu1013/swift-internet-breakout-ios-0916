//
//  DailyViewController.swift
//  niftyFlatironWeather
//
//  Created by Benjamin Su on 10/28/16.
//  Copyright © 2016 Johann Kerr. All rights reserved.
//

import UIKit

class DailyViewController: UIViewController {

    
    @IBOutlet weak var scrollView: UIScrollView!
    
    @IBOutlet weak var stackView: UIStackView!
    
    @IBOutlet weak var stackHeightConstraint: NSLayoutConstraint!
    
    let store = WeatherDataStore.sharedInstance
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
        
        
        
        
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        stackHeightConstraint.isActive = false
        stackHeightConstraint = stackView.heightAnchor.constraint(equalTo: scrollView.heightAnchor, multiplier: CGFloat(store.daily.dailyForecasts.count))
        stackHeightConstraint.isActive = true
        
        let viewSize = stackView.bounds
        print(viewSize)
        for day in store.daily.dailyForecasts {
            stackView.addArrangedSubview(createViewForStackView(day: day, viewSize: viewSize))
        }
        self.stackView.reloadInputViews()

    }


    
    
    func createViewForStackView(day: CurrentWeather, viewSize: CGRect) -> UIView {
        let newView = UIView(frame: viewSize)
        
        let sumLabel = UILabel(frame: CGRect(x: 20.0, y: 20.0, width: 100.0, height: 50.0))
        sumLabel.text = day.summary
        newView.addSubview(sumLabel)
        let tempLabel = UILabel(frame: CGRect(x: 20.0, y: 100.0, width: 100.0, height: 50.0))
        tempLabel.text = String(day.temperature)
        newView.addSubview(tempLabel)

        let humLabel = UILabel(frame: CGRect(x: 20.0, y: 180.0, width: 100.0, height: 50.0))
        humLabel.text = String(day.humidity)
        newView.addSubview(humLabel)

        return newView
    }

}
