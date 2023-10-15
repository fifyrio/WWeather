//
//  CityCell.swift
//  WWeather
//
//  Created by 沈红美 on 2023/10/15.
//

import SwiftUI

struct CityCell: View {
    let city: CityModel
    
    var body: some View {
        Image(city.imageURL)
            .resizable()
            .scaledToFit()
            .cornerRadius(10)
            .shadow(radius: 5)
            .overlay(alignment: .bottomTrailing, content: {
                NavigationLink(destination: WeatherInfoView(viewModel: .init(city: city))) {
                    Text(city.name)
                        .bold()
                        .foregroundColor(Color.white)
                        .padding()
                }
            })
    }
}

struct CityCell_Previews: PreviewProvider {
    static var previews: some View {
        CityCell(city: .init(id: 0, name: "Beijing", imageURL: "automn"))
    }
}
