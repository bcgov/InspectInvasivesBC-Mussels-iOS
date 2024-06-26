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
    if ( value == trueState ) { return "checkmark.circle" }
    return "circle"
  }
  
  let title: String;
  @Binding var value: Bool;
  @State var interacted: Bool = false
  var body: some View {
    VStack(alignment: .leading){
      InputTextLabel(text: title)
      HStack {
        Image(systemName: circlePicker(trueState: false))
          .resizable()
          .scaledToFit()
          .frame(height: 25)
          .foregroundColor(interacted && !value ? .red : .black)
          .accessibilityLabel("No")
          .onTapGesture {
            interacted = true
            value = false;
          }
        Text("No")
        Spacer().frame(width: 30)
        Image(systemName: circlePicker(trueState: true))
          .resizable()
          .scaledToFit()
          .frame(height: 25)
          .foregroundColor(interacted && value ? .green : .black)
          .accessibilityLabel("Yes")
          .onTapGesture{
            interacted = true
            value = true
          }
        Text("Yes")
      }
    }
  }
}

#Preview {
  @State var value: Bool = false
  let title: String = "CustomizedSegmentedPicker Header"
  return CustomizedSegmentedPicker(title: title, value: $value);
}
