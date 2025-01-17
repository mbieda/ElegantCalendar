// Kevin Li - 10:51 PM - 6/6/20

import SwiftUI

/// Any changes to the configuration will reset the calendar based on its new settings
public struct CalendarConfiguration: Equatable {

    public let calendar: Calendar
    public let ascending: Bool
    public let startDate: Date
    public let endDate: Date
    public let scrollBackToTodayButtonVisible: Bool
    public let accessoryViewVisible: Bool
    public let daysOfWeekHeaderVisible: Bool
    public let useTopPaddding: Bool

    public init(
        calendar: Calendar = .current,
        ascending: Bool = true,
        startDate: Date,
        endDate: Date,
        scrollBackToTodayButtonVisible: Bool = true,
        accessoryViewVisible: Bool = true,
        daysOfWeekHeaderVisible: Bool = true,
        useTopPadding: Bool = true
    ) {
        self.calendar = calendar
        self.ascending = ascending
        self.startDate = startDate
        self.endDate = endDate
        self.scrollBackToTodayButtonVisible = scrollBackToTodayButtonVisible
        self.accessoryViewVisible = accessoryViewVisible
        self.daysOfWeekHeaderVisible = daysOfWeekHeaderVisible
        self.useTopPaddding = useTopPadding
    }

    var referenceDate: Date {
        ascending ? startDate : endDate
    }

}

extension CalendarConfiguration {

    static let mock = CalendarConfiguration(
        startDate: .daysFromToday(-365*2),
        endDate: .daysFromToday(365*2))

}

protocol ConfigurationDirectAccess {

    var configuration: CalendarConfiguration { get }

}

extension ConfigurationDirectAccess {

    var calendar: Calendar {
        configuration.calendar
    }

    var startDate: Date {
        configuration.startDate
    }

    var endDate: Date {
        configuration.endDate
    }

    var referenceDate: Date {
        configuration.referenceDate
    }

}
