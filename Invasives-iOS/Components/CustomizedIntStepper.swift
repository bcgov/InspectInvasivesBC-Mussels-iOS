//
//  CustomizedInputStepper.swift
//  Invasives-iOS
//
//  Created by Matthew Logan on 2024-01-29.
//

import SwiftUI

struct CustomizedIntStepper: View {
  let title: String;
  @Binding var step: Int;
  var body: some View {
    VStack(){
      InputTextLabel(text: title)
      HStack {
        Text("\(step)")
        Stepper("\(step)", value: $step, in: 0...99)
        .labelsHidden()
      }
      .padding(.horizontal, 15)
    }
  }
}

#Preview {
  let title = "Stepper Title"
  @State var step: Int = 0;
  return CustomizedIntStepper(title: title, step: $step)
}
