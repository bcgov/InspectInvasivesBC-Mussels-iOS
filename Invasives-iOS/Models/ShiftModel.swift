//
//  ShiftModel.swift
//  Invasives-iOS
//
//  Created by Matthew Logan on 2023-12-29.
//

import Foundation
import SwiftUI
import os
/// Shift model contains all relevant information to a shift, and encompasses two smaller models
/// Watercraft Inspections and Blowbys
class ShiftModel: Identifiable, ObservableObject, Codable {
    @Published var blowBys: [BlowbyModel]
    @Published var shiftStartDate: Date
    @Published var shiftEndDate: Date
    @Published var station: String
    @Published var location: String = ""
    @Published var shift_start_comment: String
    @Published var shift_end_comment: String = ""
    @Published var status: Status = Status.Draft
    @Published var boatsInspected: [InspectionModel] = []
    @Published var k9_on_shift: Bool = false
    @Published var boats_inspected_during_shift: Bool = false
    var observer_workflow_id: Int = -1
    let shiftID = UUID()
    
    init (){
        self.shiftStartDate = Date()
        self.shiftEndDate = Date()
        self.station = Stations[0]
        self.shift_start_comment = ""
        self.blowBys = [BlowbyModel]()
    }
    
    func formattedDate(date: Date) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd"
        return dateFormatter.string(from: date)
    }
    
    func addInspection() {
        boatsInspected.append(InspectionModel())
    }
    
    func addBlowby() {
        blowBys.append(BlowbyModel())
    }
    
    /// Creates a status component used to display current state of Shift with Icon
    /// - Returns: HStack containing Icon + Text
    func getStatusComponent() -> some View {
        var color: Color
        switch self.status {
        case .Complete: color = Color.green
        case .Pending: color = Color.yellow
        default: color = Color.gray
        }
        return HStack {
            Image(systemName: StringConstants.AppIcon.shiftStatus).foregroundColor(color)
            Text(self.status.rawValue)
        }
    }
    
    //TODO: Validate all fields in Shift
    /// Validates fields and inspections in a shift, sets status
    /// - Returns: Boolean - Shift passed validation
    func validateShift() -> Bool {
      self.status = validateInspections() ? .Pending : .Draft
      return self.status != .Draft
    }
      
    // TODO: Update validations
    /// Iterate through inspections in Shift, testing their validate method to ensure all inspections passed validation
    /// Forms Iterates EACH inspection, so `validateInspection()` calls can update statuses of each inspection
    /// - Returns: Boolean - All Shifts passed validation
    func validateInspections() -> Bool {
      var isValid = true
      boatsInspected.forEach { inspection in
        if (!inspection.validateInspection()) {
          isValid = false
        }
      }
      return isValid
    }
  
  
  
  
  // MARK: - Codable Requirements. Used to Persist Data on Application
    
    enum CodingKeys: String, CodingKey {
        case blowBys, shiftStartDate, shiftEndDate, station, location, shift_start_comment, shift_end_comment, status, boatsInspected, k9_on_shift, boats_inspected_during_shift, observer_workflow_id, shiftID
    }
    
    required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        blowBys = try container.decode([BlowbyModel].self, forKey: .blowBys)
        shiftStartDate = try container.decode(Date.self, forKey: .shiftStartDate)
        shiftEndDate = try container.decode(Date.self, forKey: .shiftEndDate)
        station = try container.decode(String.self, forKey: .station)
        location = try container.decodeIfPresent(String.self, forKey: .location) ?? ""
        shift_start_comment = try container.decode(String.self, forKey: .shift_start_comment)
        shift_end_comment = try container.decodeIfPresent(String.self, forKey: .shift_end_comment) ?? ""
        status = try container.decode(Status.self, forKey: .status)
        boatsInspected = try container.decode([InspectionModel].self, forKey: .boatsInspected)
        k9_on_shift = try container.decode(Bool.self, forKey: .k9_on_shift)
        boats_inspected_during_shift = try container.decode(Bool.self, forKey: .boats_inspected_during_shift)
        observer_workflow_id = try container.decode(Int.self, forKey: .observer_workflow_id)
    }
  
    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(blowBys, forKey: .blowBys)
        try container.encode(shiftStartDate, forKey: .shiftStartDate)
        try container.encode(shiftEndDate, forKey: .shiftEndDate)
        try container.encode(station, forKey: .station)
        try container.encode(location, forKey: .location)
        try container.encode(shift_start_comment, forKey: .shift_start_comment)
        try container.encode(shift_end_comment, forKey: .shift_end_comment)
        try container.encode(status, forKey: .status)
        try container.encode(boatsInspected, forKey: .boatsInspected)
        try container.encode(k9_on_shift, forKey: .k9_on_shift)
        try container.encode(boats_inspected_during_shift, forKey: .boats_inspected_during_shift)
        try container.encode(observer_workflow_id, forKey: .observer_workflow_id)
        // shiftID is not encoded since it's a constant value
    }
}




