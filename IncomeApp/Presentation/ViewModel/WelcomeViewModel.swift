//
//  WelcomeViewModel.swift
//  IncomeApp
//
//  Created by Alejandro Salazar on 07/10/25.
//

import Foundation
import Combine
import Factory

@MainActor
final class WelcomeViewModel: ObservableObject {
    @Injected(\.appInfoStore) var appInfoStore
    
    func getAppName() -> String {
        appInfoStore.name
    }
}
