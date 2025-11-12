//
//  AppConstants.swift
//  LiveScore
//
//  Created by Maciej Banaszyński on 13/11/2025.
//

import Foundation

enum AppConstants {

    enum DateSelector {
        static let pastDaysVisible: Int = 7
        static let futureDaysVisible: Int = 7

        static var offsetRange: ClosedRange<Int> {
            (-pastDaysVisible...futureDaysVisible)
        }

        static func minDate(from reference: Date, calendar: Calendar = .current) -> Date {
            let start = calendar.startOfDay(for: reference)
            let date = calendar.date(byAdding: .day, value: -pastDaysVisible, to: start) ?? start
            return calendar.startOfDay(for: date)
        }

        static func maxDate(from reference: Date, calendar: Calendar = .current) -> Date {
            let start = calendar.startOfDay(for: reference)
            let date = calendar.date(byAdding: .day, value: futureDaysVisible, to: start) ?? start
            return calendar.startOfDay(for: date)
        }
    }
}

