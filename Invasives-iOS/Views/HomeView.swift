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
    Table($shifts.entries){
      TableColumn("ID") { $entry in
        Text(entry.shiftID.uuidString)
      }
      TableColumn("Shift Date") { $entry in
        Text(formatDate(date: entry.shiftStartDate))
      }
      TableColumn("Station Location") { $entry in
        Text(entry.station)
      }
      TableColumn("Status") { $entry in
        Text(entry.status.rawValue)
      }
      TableColumn("") { $entry in
        NavigationLink(
          destination: ShiftView(shift: $entry)) {
            Text("View")
          }
      }
    }
  }
}

struct HomeView_Previews: PreviewProvider {
  static var previews: some View {
    PreviewWrapper()
  }
}

struct HomeView_PreviewWrapper: View {
  @StateObject var shifts: ShiftModels = ShiftModels();
  var body: some View {
    MainView(shifts: shifts)
  }
}
