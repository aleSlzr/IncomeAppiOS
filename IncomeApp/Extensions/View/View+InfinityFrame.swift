//
//  View+InfinityFrame.swift
//  IncomeApp
//
//  Created by Alejandro Salazar on 08/10/25.
//

import SwiftUI

extension View {
    func infinityFrame() -> some View {
        self
            .frame(maxWidth: .infinity, maxHeight: .infinity)
    }
}
