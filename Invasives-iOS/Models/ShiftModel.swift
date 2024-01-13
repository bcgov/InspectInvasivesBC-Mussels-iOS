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

/// <#Description#>
class ShiftModel: Identifiable, ObservableObject {
  @Published var blowBys: [BlowbyModel];
  @Published var shiftStartDate: Date;
  @Published var station: String = "";
  @Published var location: String = "";
  @Published var shift_start_comment: String;
  @Published var shift_end_comment: String = "";
  @Published var status: Status = Status.Draft;
  //   @Published var boatsInspected: [WatercraftInspection] = [];
  @Published var k9_on_shift: Bool = false;
  
  var observer_workflow_id: Int = -1;
  let shiftID = UUID();
  
  
  /// <#Description#>
  /// - Parameters:
  ///   - shiftStartDate: shiftStartDate description
  ///   - station: station description
  ///   - shift_start_comments: shift_start_comments description
  init (shiftStartDate: Date = Date(), station: String = "Osoyoos", shift_start_comments: String = "Weather is ok"){
    self.shiftStartDate = shiftStartDate;
    self.station = station;
    self.shift_start_comment = shift_start_comments;
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
  func getStatusComponent() -> some View {
    var color: Color;
    switch self.status {
      case .Complete: color = Color.green;
      case .Pending: color = Color.yellow;
      default: color = Color.gray;
    }
    return HStack {
      Image(systemName: "circle.fill").foregroundColor(color)
      Text(self.status.rawValue)
    }
    
  }
}

/// <#Description#>
class ShiftModels: ObservableObject {
  @Published var entries: [ShiftModel];
  
  init() {
    entries = [ShiftModel]()
    entries.append(ShiftModel())
    entries.append(ShiftModel())
    entries.append(ShiftModel())
    entries.append(ShiftModel())
  }
  func addNewShift() {
    DispatchQueue.main.async {
      self.entries.append(ShiftModel())
    }
  }
}
