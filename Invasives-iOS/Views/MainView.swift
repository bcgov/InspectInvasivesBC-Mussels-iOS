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
          HomeView().environmentObject(shifts).navigationTitle(StringConstants.MainView.appTitle)
        }.toolbar{
          ToolbarItem(placement: .navigationBarTrailing) {
            NavigationLink(destination: SettingsView()) {
              Image(systemName: StringConstants.AppIcon.settingsIcon)
            }
          }
          ToolbarItem(placement: .navigationBarTrailing) {
            Button(action: {
              print("Sync Action")
            }){ Text(StringConstants.MainView.syncButtonLabel) }
          }
        }
      }
    } else {
      LoginView(loggedIn: $loggedIn)
    }
  }
}

#Preview {
  MainView(loggedIn: true)
}
