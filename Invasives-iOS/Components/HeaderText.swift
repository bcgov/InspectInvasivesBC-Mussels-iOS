//
//  HeaderText.swift
//  Invasives-iOS
//
//  Created by Matthew Logan on 2024-01-23.
//

import SwiftUI

struct HeaderText: View {
  var header: String;
  var body: some View {
    Text(header)
      .font(.system(size: 22))
      .bold()
      .foregroundColor(bcBlueColor)
      .padding(.leading)
  }
}

#Preview {
  let header: String = "The quick brown fox jumps over the lazy dog";
  return VStack {
    HeaderText(header: header);
    HeaderText(header: header.uppercased());
  }
}
