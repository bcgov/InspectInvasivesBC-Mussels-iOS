//
//  EmptyTable.swift
//  Invasives-iOS
//
//  Created by Matthew Logan on 2024-01-12.
//

import SwiftUI

struct EmptyTable: View {
  var collection: String;
    var body: some View {
      VStack {
        Image(systemName: "folder.fill.badge.plus")
          .resizable()
          .scaledToFit()
          .foregroundColor(.gray)
          .frame(width: 100, height: 100);
        Text("It's looking a little empty around here.").font(.system(size: 22)).bold().foregroundColor(.gray)
        Text("You have not added any \(collection) to this shift").foregroundColor(.gray)
      }
    }
}

#Preview {
  EmptyTable(collection: "[OBJECTS]")
}
