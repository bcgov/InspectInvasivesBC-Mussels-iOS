//
//  StringListStruct.swift
//  Invasives-iOS
//
//  Created by Matthew Logan on 2024-06-27.
//  Copyright © 2024 Sustainment Team. All rights reserved.
//

import Foundation

/// Used for Creating/Storing Identifiable compliant Lists for strings
struct StringListStruct: Identifiable {
  var id = UUID()
  var value: String = ""
}
