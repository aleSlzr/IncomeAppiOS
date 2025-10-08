//
//  Container+Register.swift
//  IncomeApp
//
//  Created by Alejandro Salazar on 08/10/25.
//

import Factory

extension Container {
    var appInfoStore: Factory<AppInfoLiveStore> {
        self {
            MainActor.assumeIsolated {
                AppInfoLiveStore()
            }
        }.singleton
    }
    
    var incomeStore: Factory<IncomeStore> {
        self {
            MainActor.assumeIsolated {
                IncomeLiveStore()
            }
        }.singleton
    }
}
