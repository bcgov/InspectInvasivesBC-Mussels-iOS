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
        TableColumn("Reported To Rapp"){ $entry in
          HStack{
            Toggle(entry.reportedToRapp ? "Yes" : "No", isOn: $entry.reportedToRapp).disabled(!isEditable)
            Spacer()
          }
        }
        TableColumn("Watercraft Complexity"){ $entry in
          Picker("", selection: $entry.waterCraftComplexity){
            ForEach(Complexity.allCases, id: \.self) { option in
              Text(option.rawValue)}
          }.disabled(!isEditable)
        }
        TableColumn("Blowby Time"){ $entry in
          if(isEditable){
            DatePicker("Label", selection: $entry.blowByTime, displayedComponents: .hourAndMinute)
              .swipeActions(edge: .trailing) {
                if(isEditable) {
                  Button(role: .destructive) {
                    blowBys.removeAll(where: {$0.id == $entry.id})}
                label: { Label("Delete", systemImage: "trash") }
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
