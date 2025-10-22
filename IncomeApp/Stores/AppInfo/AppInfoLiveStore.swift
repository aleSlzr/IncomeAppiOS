//
//  AppInfoLiveStore.swift
//  IncomeApp
//
//  Created by Alejandro Salazar on 08/10/25.
//

import Foundation

struct AppInfoLiveStore {
    let name: String = "Income Ultra"
    let description: String = "Income Ultra calculates your income from hourly rates or salary, including overtime, and provides detailed financial breakdowns"
    let developer: String = "Alejandro Salazar"
    let website: String = "https://github.com/aleSlzr/IncomeAppiOS"
    let agreements: Agreements = .init()
    
    var version: String {
        if let version = Bundle.main.infoDictionary?["CFBundleShortVersionString"] as? String {
            return version
        }
        return "-"
    }
    
    var compatibility: String {
        if let minVersion = Bundle.main.infoDictionary?["MinimumOSVersion"] as? String {
            return "iOS \(minVersion)+"
        }
        return "-"
    }
}

extension AppInfoLiveStore {
    struct Agreements {
        let privacyPolicyURL: String = "https://github.com/aleSlzr"
        let termsAndConditionsURL: String = "https://github.com/aleSlzr"
        let copyrightURL: String = "https://github.com/aleSlzr"
    }
}
