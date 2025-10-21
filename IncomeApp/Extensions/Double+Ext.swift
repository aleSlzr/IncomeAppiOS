//
//  Double+Ext.swift
//  IncomeApp
//
//  Created by Alejandro Salazar on 21/10/25.
//

import Foundation

extension Double {
    var formattedWithTwoDecimals: String {
        let formatter = NumberFormatter()
        formatter.numberStyle = .decimal
        formatter.minimumFractionDigits = 2
        formatter.maximumFractionDigits = 2
        return formatter.string(from: NSNumber(value: self)) ?? "0.00"
    }
    
    var formattedAsWholeCurrencyOrInvalid: String {
        guard self >= Double(Int.min), self <= Double(Int.max) else {
            return "Invalid"
        }
        let formatter = NumberFormatter()
        formatter.numberStyle = .decimal
        formatter.groupingSeparator = ","
        formatter.minimumFractionDigits = 0
        formatter.maximumFractionDigits = 0
        return formatter.string(from: NSNumber(value: self)) ?? "0"
    }
}
