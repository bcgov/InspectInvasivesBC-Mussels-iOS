//
//  StringList.swift
//  Invasives-iOS
//
//  Created by Matthew Logan on 2024-06-27.
//  Copyright © 2024 Sustainment Team. All rights reserved.
//

import SwiftUI

/// Component for Rendering An Array of Strings using `StringListStruct` that subscribe to `Identifiable`
/// Text is displayed indicating an empty list when array.count == 0
/// - Parameters:
///    - title: Header text for the List component. Also used to populate the 'Empty List' message
///    - array: `[StringListStruct]` to iterate the list with
///    - options: `[String]` Options to populate Picker
struct CustomizedStructuredList: View {
  let title: String
  @Binding var array: [StringListStruct]
  let options: [String]
  var body: some View {
    VStack(alignment: .leading) {
      HStack {
        InputTextLabel(text: title)
        Spacer().frame(width: 30)
        Image(systemName: "plus").foregroundColor(.blue)
        Button("Add Entry", action: {
          array.append(StringListStruct())
        })
      }
      if(array.count > 0){
        ForEach($array, id: \.id) { $item in
          HStack {
            Picker(title, selection: $item.value) {
              ForEach(options, id: \.self){ option in
                Text(option).frame(minWidth: 100)
              }
            }
            Spacer()
            Button(role: .destructive) {
              array.removeAll(where: {$0.id == item.id})}
          label: { Label(StringConstants.BlowbyTable.deleteLabel, systemImage: StringConstants.AppIcon.deleteIcon) }
            
          }.padding(.horizontal, 8).padding(.vertical, 2)
            .overlay(RoundedRectangle(cornerRadius: 10).stroke(.gray))
            .padding(0)
        }
      } else {
        Text("No \(title.lowercased()) listed")
      }
    }.padding(Constants.basePadding)
  }
}

#Preview {
  let title = "Standing water locations"
  @State var array: [StringListStruct] = [StringListStruct(), StringListStruct(), StringListStruct()]
  let options = ["Select a Location", "Option A", "Option B", "Option C"]
  return CustomizedStructuredList(title: title, array: $array, options: options)
}
