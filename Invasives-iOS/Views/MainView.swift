//
//  MainView.swift
//  Invasives-iOS
//
//  Created by Matthew Logan on 2023-12-29.
//

import SwiftUI

struct MainView: View {
  @State var loggedIn: Bool = false;
  @State private var showSettings = false
  @StateObject var shifts: ShiftModels = ShiftModels()
  var body: some View {
    if(loggedIn){
      NavigationStack() {
        VStack() {
          if (showSettings){SettingsView()}
          else {HomeView().environmentObject(shifts)}
        }.toolbar{
          ToolbarItem(placement: .navigationBarTrailing) {
            Button(action: {
              print("ButtonPress")
              showSettings.toggle()
            }){ Image(systemName: showSettings ? "house" : "gear") }
          }
          ToolbarItem(placement: .navigationBarTrailing) {
            Button(action: {
              print("Sync Action")
            }){ Text("Sync Now") }
          }
        }
      }
    } else {
      LoginView(loggedIn: $loggedIn)
    }
  }
}


struct MainView_Previews: PreviewProvider {
  static var previews: some View {
    PreviewWrapper()
  }
}

struct MainView_PreviewWrapper: View {
  @State var showSettings: Bool = false;
  var body: some View {
    MainView()
  }
}
