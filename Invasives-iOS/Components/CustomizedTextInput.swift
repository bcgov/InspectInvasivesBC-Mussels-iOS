//
//  CustomizedTextInput.swift
//  Invasives-iOS
//
//  Created by Matthew Logan on 2024-06-28.
//  Copyright © 2024 Sustainment Team. All rights reserved.
//

import SwiftUI

struct CustomizedTextInput: View {
  let title: String
  @Binding var text: String
  
    var body: some View {
      VStack(alignment: .leading) {
        InputTextLabel(text: title)
        TextField(title, text: $text, axis: .vertical)
            .background(inputBackgroundColor)
      }
    }
}

#Preview {
  let title: String = "Customized Text Input Title"
  @State var text: String = "Sample Text"
  return CustomizedTextInput(title: title, text: $text)
}
