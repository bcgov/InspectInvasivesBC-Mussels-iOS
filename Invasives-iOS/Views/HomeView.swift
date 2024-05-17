//
//  HomeView.swift
//  Invasives-iOS
//
//  Created by Matthew Logan on 2023-12-29.
//

import SwiftUI

struct HomeView: View {
  @EnvironmentObject var shifts: ShiftModels;
  var body: some View {
    HStack(){
      Spacer()
      Button(action: {
        shifts.addNewShift();
      }) {
        Image(systemName: StringConstants.AppIcon.addIcon)
        Text(StringConstants.HomeView.newShiftLabel);
      }.padding(.trailing)
    }
    if shifts.entries.count > 0 {
      Table($shifts.entries){
        TableColumn(StringConstants.HomeView.shiftIDLabel) { $entry in
          Text(entry.shiftID.uuidString)
        }
        TableColumn(StringConstants.HomeView.shiftDateLabel) { $entry in
          Text(entry.formattedDate(date: entry.shiftStartDate))
        }
        TableColumn(StringConstants.HomeView.stationLocationLabel) { $entry in
          Text(entry.station)
        }
        TableColumn(StringConstants.HomeView.statusLabel) { $entry in
          HStack {
            entry.getStatusComponent()
          }
        }
        TableColumn("") { $entry in
          NavigationLink(
            destination: ShiftView(shift: entry, isEditable: entry.status != Status.Complete)) {
              Text(StringConstants.HomeView.viewTextLabel)
                .foregroundColor(Color.blue)
            }.swipeActions(edge: .trailing) {
              Button(role: .destructive) {
                shifts.entries.removeAll(where: {$0.id == $entry.id})
              } label: {
                Label(StringConstants.HomeView.deleteLabel, systemImage: StringConstants.AppIcon.deleteIcon)
              }
            }
        }
      }.foregroundColor(Color.black)
    } else {
      Spacer().frame(height: 120)
      EmptyTable(collection: StringConstants.HomeView.emptyShiftTable)
      Spacer()
    }
  }
}

#Preview {
  HomeView().environmentObject(ShiftModels(previewMode: false))
}
