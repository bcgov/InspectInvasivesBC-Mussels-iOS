//
//  CustomDivider.swift
//  Invasives-iOS
//
//  Created by Matthew Logan on 2024-01-23.
//

import SwiftUI

struct CustomDivider: View {
    var body: some View {
      Divider()
        .frame(height: 1)
        .overlay(goldColor)
        .padding(.horizontal)
    }
}

#Preview {
    CustomDivider()
}
