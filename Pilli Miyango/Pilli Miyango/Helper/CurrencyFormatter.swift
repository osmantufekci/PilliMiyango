//
//  CurrencyFormatter.swift
//  Pilli Miyango
//
//  Created by Osman Tufekci on 15.11.2023.
//

import Foundation

extension String {
    func asCurrency(type: BlockTypes) -> String {
        
        let formatter = NumberFormatter()
        
        // String'i Double'a dönüştür
        if let number = Double(self) {
            formatter.numberStyle = .currency
            formatter.locale = Locale(identifier: "tr_TR") // Türk Lirası için
            formatter.maximumFractionDigits = 0
            let divider = type == .MilliPiyango ? 100.0 : 1000.0
            formatter.currencySymbol = ""
            if let formattedNumber = formatter.string(from: NSNumber(value: (number/divider))) {
                return formattedNumber + " ₺"
            } else {
                return "-"
            }
        }
        
        return "-"
    }
}

extension Date {
    var year: String {
        let calendar = Calendar.current
        let year = calendar.dateComponents([.year], from: Date()).year!.description
        
        return year
    }
}
