//
//  String+Extension.swift
//  Utils
//
//  Copyright © 2018 pgneri. All rights reserved.
//

import Foundation

extension String {

    func toDate(_ format: String = "yyyy-MM-dd HH:mm:ss") -> Date? {
        let formatter = DateFormatter()

        formatter.locale = Locale(identifier: "en_US_POSIX") // set locale to reliable US_POSIX
        formatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSSZ"

        guard let date = formatter.date(from: self) else {
            return nil
        }

        formatter.dateFormat = format
        formatter.locale = Locale(identifier: "pt_BR")
        formatter.timeZone = TimeZone(identifier: "UTC")
        let dateString = formatter.string(from: date)

        return formatter.date(from: dateString)
    }

    func removeSpecialChars() -> String {
        let okayChars: Set<Character> = Set("abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLKMNOPQRSTUVWXYZ1234567890")
        return String(self.filter { okayChars.contains($0) })
    }
}
