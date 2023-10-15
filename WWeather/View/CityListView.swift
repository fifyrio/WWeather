//
//  CityListView.swift
//  WWeather
//
//  Created by 沈红美 on 2023/10/15.
//

import SwiftUI

struct CityListView: View {
    @StateObject private var viewModel: CityListViewModel = CityListViewModel()
    var body: some View {
        ZStack {
            NavigationView {
                List {
                    ForEach(viewModel.cityList) { section in
                        CityCell(city: section)
                    }
                }
                .navigationTitle("Weather Forcasts")
            }
        }
        .task {
            viewModel.fetchCities()
        }
    }
}

struct CityListView_Previews: PreviewProvider {
    static var previews: some View {
        CityListView()
    }
}
