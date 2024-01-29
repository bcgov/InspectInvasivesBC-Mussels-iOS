//
//  CustomizedSegmentedPicker.swift
//  Invasives-iOS
//
//  Created by Matthew Logan on 2024-01-29.
//

import SwiftUI

struct CustomizedSegmentedPicker: View {
  let title: String;
  @Binding var value: Bool;
  var body: some View {
    VStack(alignment: .leading){
      InputTextLabel(text: title)
      Picker("Select Option", selection: $value) {
        Text("No").tag(false)
        Text("Yes").tag(true)
      }
      .pickerStyle(SegmentedPickerStyle())
      .frame(maxWidth: 175)
      .colorMultiply(value ? .green : .red)
      .labelsHidden()
    }
  }
}

#Preview {
  @State var value: Bool = false
  let title: String = "CustomizedSegementedPicker Title"
  return CustomizedSegmentedPicker(title: title, value: $value);
}
