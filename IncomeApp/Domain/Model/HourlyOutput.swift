//
//  HourlyOutput.swift
//  IncomeApp
//
//  Created by Alejandro Salazar on 19/10/25.
//

import Foundation

struct HourlyOutput {
    let takeHomePay: Pay
    let grossPay: Pay
    
    init(
        takeHomePay: Pay = .init(incomeType: .takeHome),
        grossPay: Pay = .init(incomeType: .gross)
    ) {
        self.takeHomePay = takeHomePay
        self.grossPay = grossPay
    }
}
