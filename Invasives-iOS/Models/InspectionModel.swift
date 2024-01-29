//
//  Inspection.swift
//  Invasives-iOS
//
//  Created by Matthew Logan on 2023-12-29.
//

import Foundation
import SwiftUI

class InspectionModel : Identifiable, Observable {
  let id = UUID()
  var userId: String = ""
  var timeStamp: Date = Date()
  @Published var status: Status = .Draft
  @Published var isPassportHolder: Bool = false
  @Published var inspectionTime: Date = Date()
  @Published var passportNumber: String = ""
  @Published var launchedOutsideBC : Bool = false
  @Published var k9Inspection: Bool = false
  @Published var k9InspectionResults: String = ""
  @Published var decontaminationPerformed: Bool = false
  @Published var marineSpeciesFound: Bool = false
  @Published var aquaticPlantsFound: Bool = false

  // Province of residence
  @Published var countryProvince: String = ""
  // Key for Remote DB
  @Published var provinceOfResidence = ""
  @Published var countryOfResidence = ""
  @Published var nonMotorized: Int = 0
  @Published var simple: Int = 0
  @Published var complex: Int = 0
  @Published var veryComplex: Int = 0
  // Watercraft Details
  @Published var numberOfPeopleInParty: Int = 0
  @Published var commerciallyHauled: Bool = false
  @Published var highRiskArea: Bool = false
  @Published var previousAISKnowlede: Bool = false
  @Published var previousAISKnowledeSource: String = ""
  @Published var previousInspection: Bool = false
  @Published var previousInspectionSource: String = ""
  @Published var previousInspectionDays: String = ""
  // Inspection Details
  @Published var marineMusselsFound: Bool = false
  @Published var cleanDrainDryAfterInspection: Bool = false
  @Published var dreissenidMusselsFoundPrevious: Bool = false
  // Dry Storage
  @Published var previousDryStorage: Bool = false
  @Published var destinationDryStorage: Bool = false
  // Unknown
  @Published var unknownPreviousWaterBody: Bool = false
  @Published var unknownDestinationWaterBody: Bool = false
  // Commercial manufacturer
  @Published var commercialManufacturerAsPreviousWaterBody: Bool = false
  @Published var commercialManufacturerAsDestinationWaterBody: Bool = false
  // High Risk Assesment fields
  @Published var highriskAIS: Bool = false
  @Published var adultDreissenidFound: Bool = false
  // General comments
  @Published var generalComments: String = ""
  
  init(){
    
  }
  
  func getFormattedTime(date: Date) -> String {
    let dateFormatter = DateFormatter()
    dateFormatter.dateFormat = "hh:mm"
    return dateFormatter.string(from: date)
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
