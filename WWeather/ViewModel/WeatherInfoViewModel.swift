//
//  WeatherInfoViewModel.swift
//  WWeather
//
//  Created by 沈红美 on 2023/10/15.
//

import Foundation

class WeatherInfoViewModel: ObservableObject {
    var city: CityModel
    
    @Published var isLoading: Bool = false
    
    @Published var weather: WeatherCastModel?
    
    init(city: CityModel, weather: WeatherCastModel? = nil) {
        self.city = city
        self.weather = weather
    }
    
    @MainActor
    func fetchWeather() async {
        guard let url = URL(string: "https://restapi.amap.com/v3/weather/weatherInfo?city=\(city.id)&key=d17928b3ffcf08f1957a67e7c515b2e6&extensions=all") else {
            return
        }
        
        do {
            isLoading = true
            let (data, _) = try await URLSession.shared.data(from: url)
            
            // Process the data as needed
            if let weather = try? JSONDecoder().decode(WeatherInfoResponse.self, from: data) {
                isLoading = false
                if let index = weather.forecasts.first?.casts.firstIndex(where: { $0.date == DateTool.getTomorrowTimeString() }) {
                    self.weather = weather.forecasts.first?.casts[index]
                }
            } else {
                isLoading = false
            }
        } catch {            
            isLoading = false
            print("Error: \(error)")
        }
    }
}
