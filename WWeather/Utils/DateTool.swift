//
//  DateTool.swift
//  WWeather
//
//  Created by 沈红美 on 2023/10/15.
//

import Foundation

class DateTool {
    static func getTomorrowTimeString() -> String {
        // Get the current date
        let currentDate = Date()

        // Use a Calendar to add one day to the current date
        var calendar = Calendar.current
        calendar.timeZone = TimeZone(identifier: "UTC")! // Set the desired time zone

        if let tomorrowDate = calendar.date(byAdding: .day, value: 1, to: currentDate) {
            // Create a DateFormatter to format the date as 'yyyy-MM-dd'
            let dateFormatter = DateFormatter()
            dateFormatter.dateFormat = "yyyy-MM-dd"
            dateFormatter.timeZone = TimeZone(identifier: "UTC")! // Set the desired time zone

            // Format the tomorrow's date as a string
            let tomorrowDateString = dateFormatter.string(from: tomorrowDate)
            return tomorrowDateString
        } else {
            return ""
        }
    }
}
