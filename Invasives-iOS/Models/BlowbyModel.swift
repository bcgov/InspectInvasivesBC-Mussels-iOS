//
//  BlowbyModel.swift
//  Invasives-iOS
//
//  Created by Matthew Logan on 2024-01-09.
//

import Foundation


struct BlowbyModel: Identifiable {

  
  let id = UUID();
  let userID = UUID();
  var blowByTime: Date = Date();
  var waterCraftComplexity: Complexity = Complexity.NonMotorized
  var reportedToRapp: Bool = false;
}

class BlowbyModels: ObservableObject {
  @Published var entries: [BlowbyModel];
  
  init() {
    entries = [BlowbyModel]()
  }
}

/// Types of Complexities for a Blowby
enum Complexity: String, CaseIterable {
  case NonMotorized = "Non-Motorized"
  case Simple = "Simple"
  case Complex = "Complex"
  case VeryComplex = "Very Complex"
}
