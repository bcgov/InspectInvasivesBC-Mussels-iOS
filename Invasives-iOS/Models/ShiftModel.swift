//
//  ShiftModel.swift
//  Invasives-iOS
//
//  Created by Matthew Logan on 2023-12-29.
//

import Foundation

enum Status: String, CaseIterable {
  case Draft = "Draft"
  case Complete = "Complete"
  case Incomplete = "Incomplete"
  case Pending = "Pending"
}

class ShiftModel: ObservableObject, Identifiable {
  var observer_workflow_id: Int = -1;
  let shiftID = UUID();
  var shiftStartDate: Date;
  var station: String = "";
  var location: String = "";
  var shift_start_comment: String;
  var shift_end_comment: String = "";
  var blowBys: [BlowbyModels];
  var status: Status = Status.Incomplete;
  //    var boatsInspected: [WatercraftInspection] = [];
  var k9_on_shift: Bool = false;
  
  
  init (shiftStartDate: Date = Date(), station: String = "Osoyoos", shift_start_comments: String = "Weather is ok"){
    self.shiftStartDate = shiftStartDate;
    self.station = station;
    self.shift_start_comment = shift_start_comments;
    blowBys = [BlowbyModels]();
  }
}

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
    entries.append(ShiftModel())
  }
}
