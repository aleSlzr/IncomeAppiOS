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
                
            }
        }
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
