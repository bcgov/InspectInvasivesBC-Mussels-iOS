//
//  BlowbyTable.swift
//  Invasives-iOS
//
//  Created by Matthew Logan on 2024-01-12.
//

import SwiftUI

struct InspectionTable: View {
  @Binding var inspections: [InspectionModel]
  var isEditable: Bool;
    var body: some View {
      if ($inspections.count > 0) {
        Table($inspections){
          TableColumn(StringConstants.InspectionTable.idHeader){ entry in
            Text("ID")
          }
          TableColumn(StringConstants.InspectionTable.riskLevelHeader){ $entry in
            Text(entry.highriskAIS ? "High" : "Low")
          }
          TableColumn(StringConstants.InspectionTable.timeAddedHeader){ $entry in
            Text(entry.getFormattedTime(date: entry.inspectionTime))
          }
          TableColumn(StringConstants.InspectionTable.statusLabel){ $entry in
            entry.getStatusComponent()
          }
          TableColumn(""){ $entry in
            NavigationLink(destination: InspectionView(inspection: entry, isEditable: isEditable)) {
              Text(isEditable ? "Edit" : "View")
                .foregroundColor(Color.blue)
            }.swipeActions(edge: .trailing) {
              Button(role: .destructive) {
                inspections.removeAll(where: {$0.id == $entry.id}
              )} label: {
                Label(StringConstants.HomeView.deleteLabel, systemImage: StringConstants.AppIcon.deleteIcon)
              }
            }
          }
        }.foregroundColor(Color.black)
      } else {
        EmptyTable(collection: StringConstants.InspectionTable.emptyTable)
      }
    }
}

#Preview {
  @State var inspections: [InspectionModel] = [
    InspectionModel(),
    InspectionModel(),
    InspectionModel()
  ];
  return InspectionTable(inspections: $inspections, isEditable: true)
}
