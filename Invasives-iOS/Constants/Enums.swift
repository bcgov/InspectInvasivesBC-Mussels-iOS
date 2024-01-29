//
//  Enums.swift
//  Invasives-iOS
//
//  Created by Matthew Logan on 2024-01-29.
//

/// Enumerator for tracking statuses of Shifts and Inspections
enum Status: String, CaseIterable {
  case Draft = "Draft"
  case Complete = "Complete"
  case Incomplete = "Incomplete"
  case Pending = "Pending"
}

/// Types of Complexities for a Blowby
enum Complexity: String, CaseIterable {
  case NonMotorized = "Non-Motorized"
  case Simple = "Simple"
  case Complex = "Complex"
  case VeryComplex = "Very Complex"
}
