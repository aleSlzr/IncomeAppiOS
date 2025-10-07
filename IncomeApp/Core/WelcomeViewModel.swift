//
//  WelcomeViewModel.swift
//  IncomeApp
//
//  Created by Alejandro Salazar on 07/10/25.
//

import Foundation
import Combine

@MainActor
final class WelcomeViewModel: ObservableObject {
    func getAppName() -> String {
        "Income Ultra"
    }
}
