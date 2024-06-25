//
//  CustomizedPicker.swift
//  Invasives-iOS
//
//  Created by Matthew Logan on 2024-06-25.
//  Copyright © 2024 Sustainment Team. All rights reserved.
//

import SwiftUI

struct CustomizedPicker: View {
  let title: String
  @Binding var value: String
  let options: [String]
  var body: some View {
    VStack(alignment: .leading){
      InputTextLabel(text: title)
      Picker(title, selection: $value){
        ForEach(options, id: \.self) { option in
          Text(option)}
      }
      .frame(minWidth: 250)
      .labelsHidden()
      .background(inputBackgroundColor)
    }
  }
}

#Preview {
  @State var value: String = ""
  let title: String = "Example Title"
  let options: [String] = ["One", "Two", "Three", "Really Big Fourth Option"]
  return CustomizedPicker(title: title, value: $value, options: options)
}
