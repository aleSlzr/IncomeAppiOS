//
//  IncomeViewModel.swift
//  IncomeApp
//
//  Created by Alejandro Salazar on 20/10/25.
//

import Foundation
import Combine
import Factory

final class IncomeViewModel: ObservableObject {
    @Published var incomePickerValue: IncomePickerView.IncomeType = .salary
    @Injected(\.incomeStore) var incomeStore
    @Injected(\.appInfoStore) var appInfoStore
    
    var appName: String {
        appInfoStore.name
    }
}
