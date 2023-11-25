//
//  EpochTimeConverter.swift
//  Pilli Miyango
//
//  Created by Osman Tufekci on 14.11.2023.
//

import Foundation

struct EpochTimeConverter {

    func calculate(between time: TimeInterval = Date().timeIntervalSince1970, with given: TimeInterval ) -> TimeInterval {
        return TimeInterval(abs(Int(time - (given/1000))))
    }
    
    func asDateString(milliseconds: Int?) -> String? {
        guard let milliseconds else { return nil }
        let seconds = TimeInterval(milliseconds) / 1000
        let date = Date(timeIntervalSince1970: seconds)

        // Tarihi string olarak formatlamak isterseniz
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd/MM/yyyy HH:mm" // İstediğiniz format
        let dateString = dateFormatter.string(from: date)
        return dateString
    }
}
