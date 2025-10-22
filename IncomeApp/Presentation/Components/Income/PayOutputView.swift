//
//  PayOutputView.swift
//  IncomeApp
//
//  Created by Alejandro Salazar on 21/10/25.
//

import SwiftUI

struct PayOutputView: View {
    let pay: Pay
    var body: some View {
        VStack(spacing: 12) {
            titleView
            payView
        }
        .frame(maxWidth: .infinity)
        .padding(12)
        .background(Color.appTheme.cellBackground)
        .cornerRadius(.cell)
    }
}

private extension PayOutputView {
    var titleView: some View {
        Text("\(pay.incomeType.description) Pay")
            .frame(maxWidth: .infinity, alignment: .leading)
            .font(.callout)
            .fontWeight(.semibold)
            .foregroundStyle(Color.appTheme.alternateAccent)
    }
    
    var payView: some View {
        ForEach(pay.breakdown, id: \.name) { singlePay in
            PayOutputRowView(name: singlePay.name, output: singlePay.value)
            if singlePay != pay.breakdown.last! {
                divider
            }
        }
    }
    
    var divider: some View {
        Divider()
            .foregroundStyle(Color.appTheme.divider)
    }
}

#Preview {
    Preview()
}

fileprivate struct Preview: View {
    var body: some View {
        PayOutputView(
            pay: .init(
                incomeType: .gross,
                weekly: 1_117,
                biWeekly: 2_235,
                fourWeekly: 4_838,
                monthly: 4_469,
                yearly: 58_100
            )
        )
        .padding()
        .infinityFrame()
        .background(Color.appTheme.viewBackground)
    }
}
