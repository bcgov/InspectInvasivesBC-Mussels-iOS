//
//  ShiftModel.swift
//  Invasives-iOS
//
//  Created by Matthew Logan on 2023-12-29.
//

import Foundation
import SwiftUI

/// <#Description#>
enum Status: String, CaseIterable {
  case Draft = "Draft"
  case Complete = "Complete"
  case Incomplete = "Incomplete"
  case Pending = "Pending"
}

/// Shift model contains all relevant information to a shift, and encompasses two smaller models
/// Watercraft Inspections and Blowbys
class ShiftModel: Identifiable, ObservableObject {
  @Published var blowBys: [BlowbyModel];
  @Published var shiftStartDate: Date;
  @Published var shiftEndDate: Date;
  @Published var station: String;
  @Published var location: String = "";
  @Published var shift_start_comment: String;
  @Published var shift_end_comment: String = "";
  @Published var status: Status = Status.Draft;
  //   @Published var boatsInspected: [WatercraftInspection] = [];
  @Published var k9_on_shift: Bool = false;
  @Published var boats_inspected_during_shift: Bool = false;
  var observer_workflow_id: Int = -1;
  let shiftID = UUID();
  
  init (){
    self.shiftStartDate = Date();
    self.shiftEndDate = Date();
    self.station = Stations[0];
    self.shift_start_comment = "";
    self.blowBys = [BlowbyModel]();
  }
  
  func formattedDate(date: Date) -> String {
    let dateFormatter = DateFormatter()
    dateFormatter.dateFormat = "yyyy-MM-dd"
    return dateFormatter.string(from: date)
  }
  
  func addBlowby() {
    blowBys.append(BlowbyModel());
  }
  
  /// Creates an Object text pairing showing the current status of the application
  /// - Returns: HStack holding Icon + Text
  func getStatusComponent() -> some View {
    var color: Color;
    switch self.status {
    case .Complete: color = Color.green;
    case .Pending: color = Color.yellow;
    default: color = Color.gray;
    }
    return HStack {
      Image(systemName: StringConstants.AppIcon.shiftStatus).foregroundColor(color)
      Text(self.status.rawValue)
    }
  }
}

/// class representing a collection of shifts centralizing the shifts being done.
class ShiftModels: ObservableObject {
  @Published var entries: [ShiftModel];
  
  init() {
    entries = [ShiftModel]()
  }
  func addNewShift() {
    DispatchQueue.main.async {
      self.entries.append(ShiftModel())
    }
  }
}
