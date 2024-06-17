//
//  Invasives_iOSApp.swift
//  Invasives-iOS
//
//  Created by Matthew Logan on 2023-12-29.
//

import SwiftUI
import CoreData

@main
struct Invasives_iOSApp: App {
  @StateObject var shifts: ShiftModels = ShiftModels()
  @Environment(\.scenePhase) var scenePhase
  var body: some Scene {
    WindowGroup {
      MainView().environmentObject(shifts)
    }.onChange(of: scenePhase, perform: {
      phase in
      switch phase {
      case .background:
        shifts.saveObjects()
      default:
        break
      }
    })
  }
}
