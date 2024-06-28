//
//  CustomNumberPicker.swift
//  Invasives-iOS
//
//  Created by Matthew Logan on 2024-06-28.
//  Copyright © 2024 Sustainment Team. All rights reserved.
//

import SwiftUI


struct CustomNumberPicker: View {
  let title: String
  @Binding var value: String
  var body: some View {
    VStack(alignment: .leading) {
      InputTextLabel(text: title)
      TextField("Enter a number", text: $value)
        .keyboardType(.decimalPad)
        .onChange(of: value) { newValue in
          if !newValue.isEmpty {
            // Filter out non-numeric characters
            let filtered = newValue.filter { "0123456789".contains($0) }
            if filtered != newValue {
              self.value = filtered
            }
          }
        }
        .textFieldStyle(RoundedBorderTextFieldStyle())
    }
  }
}



#Preview {
  let title: String = "CustomNumberPicker Title"
  @State var value: String = ""
  return CustomNumberPicker(title: title, value: $value)
}
