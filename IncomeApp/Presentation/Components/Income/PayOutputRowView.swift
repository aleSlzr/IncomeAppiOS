//
//  PayOutputRowView.swift
//  IncomeApp
//
//  Created by Alejandro Salazar on 21/10/25.
//

import SwiftUI

struct PayOutputRowView: View {
    let name: String
    let output: Double
    
    var body: some View {
        HStack(spacing: 16) {
            nameView
            Spacer()
            outputView
        }
    }
}

private extension PayOutputRowView {
    var nameView: some View {
        Text(name)
            .font(.callout)
            .foregroundStyle(Color.appTheme.secondaryText)
    }
    
    var outputView: some View {
        Text("$ \(output.formattedAsWholeCurrencyOrInvalid)")
            .foregroundStyle(Color.appTheme.accent)
            .fontWeight(.semibold)
    }
}

#Preview {
    Preview()
}

fileprivate struct Preview: View {
    var body: some View {
        PayOutputRowView(
            name: "Hourly Wage",
            output: 1_117
        )
        .padding()
        .infinityFrame()
        .background(Color.appTheme.viewBackground)
    }
}

