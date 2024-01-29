//
//  BlowbyModel.swift
//  Invasives-iOS
//
//  Created by Matthew Logan on 2024-01-09.
//

import Foundation


struct BlowbyModel: Identifiable, Observable {
  let id = UUID();
  let userID = 7;
  var blowByTime: Date = Date();
  var waterCraftComplexity: Complexity = .NonMotorized
  var reportedToRapp: Bool = false;
  
  func getFormattedTime(date: Date) -> String {
    let dateFormatter = DateFormatter()
    dateFormatter.dateFormat = "hh:mm"
    return dateFormatter.string(from: date)
  }
}
