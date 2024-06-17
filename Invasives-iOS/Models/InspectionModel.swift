//
//  Inspection.swift
//  Invasives-iOS
//
//  Created by Matthew Logan on 2023-12-29.
//

import Foundation
import SwiftUI

class InspectionModel: Identifiable, ObservableObject, Codable {
    let id = UUID()
    var userId: String = ""
    var timeStamp: Date = Date()
    @Published var status: Status = .Draft
    @Published var isPassportHolder: Bool = false
    @Published var inspectionTime: Date = Date()
    @Published var passportNumber: String = ""
    @Published var launchedOutsideBC: Bool = false
    @Published var k9Inspection: Bool = false
    @Published var k9InspectionResults: String = ""
    @Published var decontaminationPerformed: Bool = false
    @Published var marineSpeciesFound: Bool = false
    @Published var aquaticPlantsFound: Bool = false
  
    @Published var countryProvince: String = ""
    @Published var provinceOfResidence = ProvinceState[0]
    @Published var countryOfResidence = ""
    @Published var nonMotorized: Int = 0
    @Published var simple: Int = 0
    @Published var complex: Int = 0
    @Published var veryComplex: Int = 0
    // Watercraft Details
    @Published var numberOfPeopleInParty: Int = 0
    @Published var commerciallyHauled: Bool = false
    @Published var highRiskArea: Bool = false
    @Published var previousAISKnowledge: Bool = false
    @Published var previousAISKnowledgeSource: String = "Select Source"
    @Published var previousInspection: Bool = false
    @Published var previousInspectionSource: String = ""
    @Published var previousInspectionDays: String = ""
    // Inspection Details Flags
    @Published var marineMusselsFound: Bool = false
    @Published var cleanDrainDryAfterInspection: Bool = false
    @Published var dreissenidMusselsFoundPrevious: Bool = false
    @Published var watercraftHasDrainplugs: Bool = false
    @Published var drainplugRemovedAtInspection: Bool = false
    // Dry Storage Flag
    @Published var previousDryStorage: Bool = false
    @Published var destinationDryStorage: Bool = false
    // Unknown Waterbody Flags
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
    
    init() {}
  
    /// Validators for BasicInformation Section of Inspection
    /// - Returns: Basic Information Section is valid
    func validateBasicInformation() -> Bool {
      return provinceOfResidence != "Select Province"
    }
  
    // TODO: Add all validation Fields
    /// Checks validation for entire form, skips if Pending or Complete, updates Status
    /// - Returns: Entire Form passes validation
    func validateInspection() -> Bool {
      if self.status == .Complete { return true }
      
      let formValid: Bool = validateBasicInformation() // TODO: Chain other validate functions here
      self.status = formValid ? .Pending : .Draft
      return formValid
    }
  
    /// Formats Date time object to hours and minutes
    /// - Returns: Formatted Time string
    func getFormattedTime(date: Date) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "hh:mm"
        return dateFormatter.string(from: date)
    }
    
    /// Creates a Component showing status of inspection
    /// - Returns: HStack containing Icon + Text
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
    
  // MARK: - Codable Requirements. Used to Persist Data on Application
  
    enum CodingKeys: String, CodingKey {
        case id, userId, timeStamp, status, isPassportHolder, inspectionTime, passportNumber, launchedOutsideBC, k9Inspection, k9InspectionResults, decontaminationPerformed, marineSpeciesFound, aquaticPlantsFound, countryProvince, provinceOfResidence, countryOfResidence, nonMotorized, simple, complex, veryComplex, numberOfPeopleInParty, commerciallyHauled, highRiskArea, previousAISKnowledge, previousAISKnowledgeSource, previousInspection, previousInspectionSource, previousInspectionDays, marineMusselsFound, cleanDrainDryAfterInspection, dreissenidMusselsFoundPrevious, previousDryStorage, destinationDryStorage, unknownPreviousWaterBody, unknownDestinationWaterBody, commercialManufacturerAsPreviousWaterBody, commercialManufacturerAsDestinationWaterBody, highriskAIS, adultDreissenidFound, generalComments
    }
    
    required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        userId = try container.decode(String.self, forKey: .userId)
        timeStamp = try container.decode(Date.self, forKey: .timeStamp)
        status = try container.decode(Status.self, forKey: .status)
        isPassportHolder = try container.decode(Bool.self, forKey: .isPassportHolder)
        inspectionTime = try container.decode(Date.self, forKey: .inspectionTime)
        passportNumber = try container.decode(String.self, forKey: .passportNumber)
        launchedOutsideBC = try container.decode(Bool.self, forKey: .launchedOutsideBC)
        k9Inspection = try container.decode(Bool.self, forKey: .k9Inspection)
        k9InspectionResults = try container.decode(String.self, forKey: .k9InspectionResults)
        decontaminationPerformed = try container.decode(Bool.self, forKey: .decontaminationPerformed)
        marineSpeciesFound = try container.decode(Bool.self, forKey: .marineSpeciesFound)
        aquaticPlantsFound = try container.decode(Bool.self, forKey: .aquaticPlantsFound)
        // Decode other properties similarly
    }
    
    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(userId, forKey: .userId)
        try container.encode(timeStamp, forKey: .timeStamp)
        try container.encode(status, forKey: .status)
        try container.encode(isPassportHolder, forKey: .isPassportHolder)
        try container.encode(inspectionTime, forKey: .inspectionTime)
        try container.encode(passportNumber, forKey: .passportNumber)
        try container.encode(launchedOutsideBC, forKey: .launchedOutsideBC)
        try container.encode(k9Inspection, forKey: .k9Inspection)
        try container.encode(k9InspectionResults, forKey: .k9InspectionResults)
        try container.encode(decontaminationPerformed, forKey: .decontaminationPerformed)
        try container.encode(marineSpeciesFound, forKey: .marineSpeciesFound)
        try container.encode(aquaticPlantsFound, forKey: .aquaticPlantsFound)
        // Encode other properties similarly
    }
}
