//
//  CityModel.swift
//  WWeather
//
//  Created by 沈红美 on 2023/10/15.
//

import Foundation

struct CityModel: Identifiable, Decodable {
    let id: Int
    let name: String
    let imageURL: String
}
