//
//  BlowbyTable.swift
//  Invasives-iOS
//
//  Created by Matthew Logan on 2024-01-12.
//

import SwiftUI

struct BlowbyTable: View {
  @Binding var blowBys: [BlowbyModel]
  var isEditable: Bool;
    var body: some View {
      Table($blowBys){
        TableColumn(StringConstants.BlowbyTable.reportedToRapp){ $entry in
          HStack{
            Toggle(entry.reportedToRapp ? "Yes" : "No", isOn: $entry.reportedToRapp).disabled(!isEditable)
            Spacer()
          }
        }
        TableColumn(StringConstants.BlowbyTable.watercraftComplexity){ $entry in
          Picker("", selection: $entry.waterCraftComplexity){
            ForEach(Complexity.allCases, id: \.self) { option in
              Text(option.rawValue)}
          }.disabled(!isEditable)
        }
        TableColumn(StringConstants.BlowbyTable.blowbyTime){ $entry in
          if(isEditable){
            DatePicker("", selection: $entry.blowByTime, displayedComponents: .hourAndMinute)
              .swipeActions(edge: .trailing) {
                if(isEditable) {
                  Button(role: .destructive) {
                    blowBys.removeAll(where: {$0.id == $entry.id})}
                label: { Label(StringConstants.BlowbyTable.deleteLabel, systemImage: StringConstants.AppIcon.deleteIcon) }
                }
              }
          } else {
            Text(entry.getFormattedTime(date: entry.blowByTime))
          }
        }
      }.foregroundColor(Color.black)
    }
}

#Preview {
  @State var blowBys: [BlowbyModel] = [];
  return BlowbyTable(blowBys: $blowBys, isEditable: true)
}
