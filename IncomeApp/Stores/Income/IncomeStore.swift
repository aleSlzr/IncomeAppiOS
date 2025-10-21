//
//  IncomeStore.swift
//  IncomeApp
//
//  Created by Alejandro Salazar on 08/10/25.
//

import Foundation

protocol IncomeStore {
    func getSalaryOutput(for salaryInput: SalaryInput) -> SalaryOutput
    func getHourlyOutput(for hourlyInput: HourlyInput) -> HourlyOutput
}
