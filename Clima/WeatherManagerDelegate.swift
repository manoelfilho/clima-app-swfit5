//
//  WeatherManagerDelegate.swift
//  Clima
//
//  Created by Manoel Filho on 26/08/20.
//  Copyright © 2020 App Brewery. All rights reserved.
//

import Foundation

protocol WeatherManagerDelegate {
    func didUpdateWeather(_ weatherManager: WeatherManager, weather: WeatherModel)
    func didiFailWithError(error: Error)
}
