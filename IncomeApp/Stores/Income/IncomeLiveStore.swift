//
//  IncomeLiveStore.swift
//  IncomeApp
//
//  Created by Alejandro Salazar on 08/10/25.
//

import Foundation

final class IncomeLiveStore: IncomeStore {
    func getSalaryOutput(for salaryInput: SalaryInput) -> SalaryOutput {
        calculateSalaryOutput(for: salaryInput)
    }
    
    func getHourlyOutput(for hourlyInput: HourlyInput) -> HourlyOutput {
        calculateHourlyOutput(for: hourlyInput)
    }
}

private extension IncomeLiveStore {
    func calculateSalaryOutput(for salaryInput: SalaryInput) -> SalaryOutput {
        guard let yearlyGrossPay = salaryInput.yearlyGross else {
            return .init()
        }
        
        let weeklyGrossPay: Double = yearlyGrossPay / K.TimeConstant.weeksInYear
        let biWeeklyGrossPay: Double = weeklyGrossPay * 2
        let fourWeeklyGrossPay: Double = weeklyGrossPay * 4
        let monthlyGrossPay: Double = yearlyGrossPay / K.TimeConstant.monthsInYear
        
        let hourlyWage: Double = weeklyGrossPay / K.TimeConstant.hoursPerWeek
        
        let takeHomePercentageDefaultValue: Double = 83.00
        let takeHomePercentage: Double = salaryInput.takeHomePercentage ?? takeHomePercentageDefaultValue
        let takeHomeMultiplier: Double = takeHomePercentage / 100
        
        return .init(
            hourlyWage: hourlyWage,
            takeHomePay: .init(
                incomeType: .takeHome,
                weekly: weeklyGrossPay * takeHomeMultiplier,
                biWeekly: biWeeklyGrossPay * takeHomeMultiplier,
                fourWeekly: fourWeeklyGrossPay * takeHomeMultiplier,
                monthly: monthlyGrossPay * takeHomeMultiplier,
                yearly: yearlyGrossPay * takeHomeMultiplier,
            ),
            grossPay: .init(
                incomeType: .gross,
                weekly: weeklyGrossPay,
                biWeekly: biWeeklyGrossPay,
                fourWeekly: fourWeeklyGrossPay,
                monthly: monthlyGrossPay,
                yearly: yearlyGrossPay,
            )
        )
    }
    
    func calculateHourlyOutput(for hourlyInput: HourlyInput) -> HourlyOutput {
        guard let hourlyWage = hourlyInput.hourlyWage,
              let hoursPerWeek = hourlyInput.hoursPerWeek
        else {
            return .init()
        }
        
        let regularHours = min(hoursPerWeek, K.TimeConstant.hoursPerWeekLimitForOvertime)
        let overtimeHours = max(0, hoursPerWeek - K.TimeConstant.hoursPerWeekLimitForOvertime)
        let overtimeHourlyWage = hourlyWage * K.TimeConstant.overtimeRate
        let shouldCalculateOvertime: Bool = (overtimeHours > 0 && hourlyInput.overtime)
        
        let weeklyGrossPay: Double = shouldCalculateOvertime ? (regularHours * hourlyWage) + (overtimeHours * overtimeHourlyWage) : (hoursPerWeek * hourlyWage)
        let biWeeklyGrossPay = weeklyGrossPay * 2
        let fourWeeklyGrossPay = weeklyGrossPay * 4
        let yearlyGrossPay = weeklyGrossPay * K.TimeConstant.weeksInYear
        let monthlyGrossPay = yearlyGrossPay / K.TimeConstant.monthsInYear
        
        let takeHomePercentageDefaultValue: Double = 83.00
        let takeHomePercentage = hourlyInput.takeHomePercentage ?? takeHomePercentageDefaultValue
        let takeHomeMultiplier = takeHomePercentage / 100
        
        return .init(
            takeHomePay: .init(
                incomeType: .takeHome,
                weekly: weeklyGrossPay * takeHomeMultiplier,
                biWeekly: biWeeklyGrossPay * takeHomeMultiplier,
                fourWeekly: fourWeeklyGrossPay * takeHomeMultiplier,
                monthly: monthlyGrossPay * takeHomeMultiplier,
                yearly: yearlyGrossPay * takeHomeMultiplier
            ),
            grossPay: .init(
                incomeType: .gross,
                weekly: weeklyGrossPay,
                biWeekly: biWeeklyGrossPay,
                fourWeekly: fourWeeklyGrossPay,
                monthly: monthlyGrossPay,
                yearly: yearlyGrossPay
            )
        )
    }
}
