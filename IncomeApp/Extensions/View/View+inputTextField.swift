//
//  View+inputTextField.swift
//  IncomeApp
//
//  Created by Alejandro Salazar on 20/10/25.
//

import SwiftUI

extension View {
    func inputTextField() -> some View {
        self
            .keyboardType(.decimalPad)
            .padding(22)
            .frame(maxWidth: .infinity)
            .background(Color.appTheme.cellBackground)
            .cornerRadius(.textField)
            .shadow(.regular)
    }
}
