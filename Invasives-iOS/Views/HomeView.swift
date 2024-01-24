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
        Image(systemName: "plus")
        Text("Add New Shift");
      }.padding(.trailing)
    }
    if shifts.entries.count > 0 {
      Table($shifts.entries){
        TableColumn("Shift ID") { $entry in
          Text(entry.shiftID.uuidString)
        }
        TableColumn("Shift Date") { $entry in
          Text(entry.formattedDate(date: entry.shiftStartDate))
        }
        TableColumn("Station Location") { $entry in
          Text(entry.station)
        }
        TableColumn("Status") { $entry in
          HStack {
            entry.getStatusComponent()
          }
        }
        TableColumn("") { $entry in
          NavigationLink(
            destination: ShiftView(shift: entry, isEditable: entry.status != Status.Complete)) {
              Text("View")
                .foregroundColor(Color.blue)
            }.swipeActions(edge: .trailing) {
              Button(role: .destructive) {
                shifts.entries.removeAll(where: {$0.id == $entry.id})
              } label: {
                Label("Delete", systemImage: "trash")
              }
            }
        }
      }.foregroundColor(Color.black)
    } else {
      Spacer().frame(height: 120)
      EmptyTable(collection: "Shifts")
      Spacer()
    }
  }
}

#Preview {
  HomeView().environmentObject(ShiftModels())
}
