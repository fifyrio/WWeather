//
//  CityListViewModel.swift
//  WWeather
//
//  Created by 沈红美 on 2023/10/15.
//

import Foundation

class CityListViewModel: ObservableObject {
    @Published var cityList: [CityModel] = []
    func fetchCities() {
        if let path = Bundle.main.path(forResource: "Cities", ofType: "plist") {
            do {
                let data = try Data(contentsOf: URL(fileURLWithPath: path))
                let decoder = PropertyListDecoder()
                let cityModels = try decoder.decode([CityModel].self, from: data)
                self.cityList = cityModels
            } catch {                
                print("Error loading data from Plist: \(error)")
            }
        }
    }
}
