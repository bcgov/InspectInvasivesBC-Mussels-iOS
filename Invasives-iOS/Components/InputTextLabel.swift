//
//  InputTextLabel.swift
//  Invasives-iOS
//
//  Created by Matthew Logan on 2024-01-23.
//

import SwiftUI

struct InputTextLabel: View {
  var text: String;
    var body: some View {
        Text(text)
        .foregroundColor(eigengrauColor)
        .bold()
        .font(.system(size: 14))
    }
}

#Preview {
  var text: String = "The quick brown fox jumps over the lazy dog";
  return VStack {
    InputTextLabel(text: text);
    InputTextLabel(text: text.uppercased());
  }
}
