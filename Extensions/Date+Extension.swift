//
//  Date+Extension.swift
//  Utils
//
//  Copyright © 2018 pgneri. All rights reserved.
//

import Foundation

extension Date {

    var day: Int {return Calendar.current.component(.day, from:self)}
    var month: Int {return Calendar.current.component(.month, from:self)}
    var year: Int {return Calendar.current.component(.year, from:self)}

    func toString(_ format: String = "dd/MM/yyyy") -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.locale = Locale(identifier: "en_US_POSIX")
        dateFormatter.timeZone = TimeZone(identifier: "UTC")
        dateFormatter.dateFormat = format
        return dateFormatter.string(from: self)
    }
}
