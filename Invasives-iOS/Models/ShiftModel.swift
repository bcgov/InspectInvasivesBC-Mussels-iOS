//
//  ShiftModel.swift
//  Invasives-iOS
//
//  Created by Matthew Logan on 2023-12-29.
//

import Foundation

struct ShiftModel: Observable {
  var observer_workflow_id: Int = -1;
  var date: Date = Date();
  var start_time: Date = Date();
  var end_time: Date = Date();
  var station: String = "";
  var location: String = "";
  var shift_start_comment: String = "";
  var shift_end_comment: String = "";
  //    var blowBys: [BlowBy] = []
  //    var boatsInspected: [WatercraftInspection] = [];
  var k9_on_shift: Bool = false;
  init (){
    
  }
}
