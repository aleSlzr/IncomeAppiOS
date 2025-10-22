//
//  IncomeAppApp.swift
//  IncomeApp
//
//  Created by Alejandro Salazar on 07/10/25.
//

import SwiftUI

@main
struct IncomeAppApp: App {
    @AppStorage(UserDefaultKeys.isDarkmode) private var isDarkMode: Bool = true
    
    var body: some Scene {
        WindowGroup {
            AppStartingView()
                .preferredColorScheme(isDarkMode ? .dark : .light)
        }
    }
}
