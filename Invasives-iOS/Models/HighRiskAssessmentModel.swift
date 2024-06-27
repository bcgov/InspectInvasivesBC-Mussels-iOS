//
//  HighRiskAssessmentModel.swift
//  Invasives-iOS
//
//  Created by Matthew Logan on 2024-06-27.
//  Copyright © 2024 Sustainment Team. All rights reserved.
//

import Foundation

/// Extended section of Inspection Models, stored as a separate table in the DB
class HighRiskAssessmentModel: Identifiable {
  @Published var userId: String = ""
  @Published var localId: String = UUID().uuidString
  @Published var remoteId: String = ""
  
  @Published var watercraftRegistration: String = ""
  @Published var cleanDrainDryAfterInspection: Bool = false
  @Published var otherInspectionFindings: String = ""
  @Published var quarantinePeriodIssued: Bool = false
  
  @Published var standingWaterPresent: Bool = false
  @Published var standingWaterLocation: [StringListStruct] = []
  
  @Published var adultDreissenidMusselsFound: Bool = false
  @Published var adultDreissenidMusselsLocation: [StringListStruct] = []
  
  @Published var decontaminationPerformed: Bool = false
  @Published var decontaminationReference: String = ""
  
  @Published var decontaminationOrderIssued: Bool = false
  @Published var decontaminationAppendixB: Bool = false
  @Published var decontaminationOrderNumber: Int = 0
  @Published var decontaminationOrderReason: String = ""
  
  @Published var sealIssued: Bool = false
  @Published var sealNumber: Int = 0;
  
  @Published var dreissenidMusselsFoundPrevious: Bool = false;
  @Published var generalComments: String = ""
  
}
