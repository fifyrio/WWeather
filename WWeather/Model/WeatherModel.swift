//
//  WeatherModel.swift
//  WWeather
//
//  Created by 沈红美 on 2023/10/15.
//

import Foundation

struct WeatherInfoResponse: Decodable {
    var status: String
    var count: String
    var info: String
    var infocode: String
    var forecasts: [WeatherForecasts]
}

struct WeatherForecasts: Decodable {
    var city: String
    var adcode: String
    var province: String
    var reporttime: String
    var casts: [WeatherCastModel]
}

struct WeatherCastModel: Decodable {
    var date: String
    var week: String
    var dayweather: String
    var nightweather: String
    var daytemp: String
    var nighttemp: String
    var daywind: String
    var nightwind: String
    var daypower: String
    var nightpower: String
    var daytemp_float: String
    var nighttemp_float: String    
}

