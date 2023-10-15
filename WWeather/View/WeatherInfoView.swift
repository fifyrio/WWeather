//
//  WeatherInfoView.swift
//  WWeather
//
//  Created by 沈红美 on 2023/10/15.
//

import SwiftUI

struct WeatherInfoView: View {
    
    @StateObject var viewModel: WeatherInfoViewModel
    
    @ViewBuilder
    var infoView: some View {
        Image(viewModel.city.imageURL)
            .resizable()
            .scaledToFit()
            .overlay(alignment: .bottom, content: {
                VStack {
                    Text("\(viewModel.city.name) 明日天气")
                        .bold()
                        .foregroundColor(Color.white)
                        .padding()
                    Text(viewModel.weather?.date ?? "--")
                        .font(.caption)
                        .foregroundColor(Color.white)
                        .padding()
                }
            })
        Text("白天")
            .font(.caption)
            .foregroundColor(.gray)
        Text(viewModel.weather?.dayweather ?? "--")
            .font(.title)
        Text("\(viewModel.weather?.daytemp ?? "--")℃")
            .font(.title2)
        Divider()
        Text("晚上")
            .font(.caption)
            .foregroundColor(.gray)
        Text(viewModel.weather?.nightweather ?? "--")
            .font(.title)
        Text("\(viewModel.weather?.nighttemp ?? "--")℃")
            .font(.title2)
    }
    
    var body: some View {
        VStack(spacing: 20) {
            if viewModel.isLoading {
                LoadingView()
            } else {
                infoView
            }                        
        }
        .task {
            await viewModel.fetchWeather()
        }
    }
}

struct WeatherInfoView_Previews: PreviewProvider {
    static var previews: some View {
        WeatherInfoView(viewModel: .init(city: .init(id: 310000, name: "Shanghai", imageURL: "Shanghai")))
    }
}
