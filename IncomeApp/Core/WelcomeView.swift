//
//  WelcomeView.swift
//  IncomeApp
//
//  Created by Alejandro Salazar on 07/10/25.
//

import SwiftUI

struct WelcomeView: View {
    @Binding var shouldShowWelcomeView: Bool
    var body: some View {
        VStack(spacing: 20) {
            Text("Welcome View")
            Button {
                shouldShowWelcomeView = false
            } label: {
                Text("Get started")
            }
        }
    }
}

#Preview {
    WelcomeView(shouldShowWelcomeView: .constant(true))
}
