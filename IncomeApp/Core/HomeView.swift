//
//  HomeTabView.swift
//  IncomeApp
//
//  Created by Alejandro Salazar on 07/10/25.
//

import SwiftUI

struct HomeView: View {
    var body: some View {
        TabView {
            incomeTabItem
            settingsTabItem
        }
    }
}

private extension HomeView {
    var incomeTabItem: some View {
        NavigationStack {
            IncomeView()
        }
        .tabItem {
            Image(systemName: "dollarsign.square")
            Text("Income")
        }
    }
    
    var settingsTabItem: some View {
        SettingsView()
            .tabItem {
                Image(systemName: "gearshape")
                Text("Settings")
            }
    }
}

#Preview {
    HomeView()
}
