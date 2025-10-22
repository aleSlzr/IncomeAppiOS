//
//  SettingsViewModel.swift
//  IncomeApp
//
//  Created by Alejandro Salazar on 21/10/25.
//

import Foundation
import Combine
import Factory

@MainActor
final class SettingsViewModel: ObservableObject {
    @Injected(\.appInfoStore) var appInfoStore
    
    var applicationData: InfoBoxView.Data {
        .init(
            title: "Application",
            sfSymbol: "apps.iphone",
            infoData: [
                .init(title: "Developer", description: appInfoStore.developer),
                .init(title: "Version", description: appInfoStore.version),
                .init(title: "Compatibility", description: appInfoStore.compatibility),
                .init(title: "Website", urlString: appInfoStore.website),
            ]
        )
    }
    
    var agreementsData: InfoBoxView.Data {
        .init(
            title: "Agreements",
            sfSymbol: "apps.iphone",
            infoData: [
                .init(title: "Privacy Policy", urlString: appInfoStore.agreements.privacyPolicyURL),
                .init(title: "Terms and Conditions", urlString: appInfoStore.agreements.termsAndConditionsURL),
                .init(title: "Copyright", urlString: appInfoStore.agreements.copyrightURL),
            ])
    }
    
    func getAppName() -> String {
        appInfoStore.name
    }
    
    func getAppDescription() -> String {
        appInfoStore.description
    }
}
