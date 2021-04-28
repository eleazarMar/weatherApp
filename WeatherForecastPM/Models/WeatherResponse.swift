//
//  WeatherResponse.swift
//  WeatherForecastPM
//
//  Created by P.M. Class on 4/28/21.
//

import Foundation

struct WeatherResponse: Codable {
    var current: Weather
    var hourly: [Weather]
 //   var daily: [DailyWeather]
}
