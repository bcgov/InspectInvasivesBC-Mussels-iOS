//
//  CustomizedSegmentedPicker.swift
//  Invasives-iOS
//
//  Created by Matthew Logan on 2024-01-29.
//

import SwiftUI

/// A Customized Yes/No radio button picker
/// - Parameters:
///    - title: Overhead text to display in component
///    - value: The boolean component to toggle state on
struct CustomizedSegmentedPicker: View {
  
  /// Returns the `systemName` for an image based on current conditions
  ///  - Parameters:
  ///     - trueState: Condition for the button to be selected "circle.fill", if component isn't interacted it's false by default
  ///     - Returns: systemName
  func circlePicker(trueState: Bool) -> String {
    if ( !interacted ) { return "circle" }
    if ( value == trueState ) { return "circle.fill" }
    return "circle"
  }
  
  let title: String;
  @Binding var value: Bool;
  @State var interacted: Bool = false
  var body: some View {
    VStack(alignment: .leading){
      InputTextLabel(text: title)
      HStack {
        Image(systemName: circlePicker(trueState: true))
          .resizable()
          .scaledToFit()
          .foregroundColor(interacted && value ? .green : .black)
          .accessibilityLabel("Yes")
          .onTapGesture{
            interacted = true
            value = true
          }
        Text("Yes")
          Spacer()
        Image(systemName: circlePicker(trueState: false))
          .resizable()
          .scaledToFit()
          .foregroundColor(interacted && !value ? .red : .black)
          .accessibilityLabel("No")
          .onTapGesture {
            interacted = true
            value = false;
          }
        Text("No")
        Spacer()
      }
    }.frame(width: 200, height: 50)
  }
}

#Preview {
  @State var value: Bool = false
  let title: String = "CustomizedSegmentedPicker"
  return CustomizedSegmentedPicker(title: title, value: $value);
}
