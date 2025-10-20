//
//  IncomeView.swift
//  IncomeApp
//
//  Created by Alejandro Salazar on 08/10/25.
//

import SwiftUI

struct IncomeView: View {
    @StateObject
    private var viewModel = IncomeViewModel()
    
    var body: some View {
        incomeView
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                toolbarItems
            }
    }
}

private extension IncomeView {
    var incomeView: some View {
        ScrollView {
            VStack(spacing: 16) {
                IncomePickerView($viewModel.incomePickerValue)
                switch viewModel.incomePickerValue {
                case .salary:
                    salaryView
                case .hourly:
                    hourlyView
                }
            }
            .padding(.horizontal)
            .padding(.vertical, 8)
        }
    }
    
    @ViewBuilder
    var salaryView: some View {
        salaryInputView
        salaryOutputView
    }
    
    var salaryInputView: some View {
        Text("salary input view")
    }
    
    var salaryOutputView: some View {
        Text("salary output view")
    }
    
    @ViewBuilder
    var hourlyView: some View {
        hourlyInputView
        hourlyOutputView
    }
    
    var hourlyInputView: some View {
        Text("hourly input view")
    }
    
    var hourlyOutputView: some View {
        Text("hourly output view")
    }
    
    @ToolbarContentBuilder
    var toolbarItems: some ToolbarContent {
        ToolbarItem(placement: .principal) {
            HStack(spacing: 5) {
                Image(systemName: "dollarsign.circle")
                    .foregroundStyle(Color.appTheme.accent)
                Text(viewModel.appName)
            }
        }
    }
}

#Preview {
    NavigationStack {
        IncomeView()
    }
}
