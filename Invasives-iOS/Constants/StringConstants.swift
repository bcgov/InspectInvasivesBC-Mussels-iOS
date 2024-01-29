//
//  StringConstants.swift
//  Invasives-iOS
//
//  Created by Matthew Logan on 2024-01-12.
//

import Foundation

///Placeholder data for development
var Stations: [String]  = [
  "Osoyoos",
  "Prince George",
  "Victoria",
  "Vancouver",
  "Richmond"
].sorted()

var ProvinceState: [String] = [
  "British Columbia - BC",
  "Alberta - AB",
  "California - CA",
];

/// Text content of application, centralized in one place for ease of updating
/// Broken down into structs representing corresponding views or purpose
struct StringConstants {
  
  struct AppIcon {
    static let deleteIcon: String = "trash";
    static let addIcon: String = "plus";
    static let settingsIcon: String = "gear";
    static let k9OnShift: String = "dog.fill";
    static let boatsInspected: String = "sailboat.fill";
    static let shiftStatus: String = "circle.fill"
    static let emptyCollection: String = "folder.fill.badge.plus";
  }
  
  struct MainView {
    static let appTitle: String = "Mussel Inspect App"
    static let syncButtonLabel: String = "Sync Now"
  }
  
  struct HomeView {
    static let newShiftLabel: String = "Add New Shift";
    static let shiftIDLabel: String = "Shift ID";
    static let shiftDateLabel: String = "Shift Date";
    static let stationLocationLabel: String = "Station Location";
    static let statusLabel: String = "Status";
    static let viewTextLabel: String = "View";
    static let emptyShiftTable = "Shifts";
    static let deleteLabel = "Text"
  }
  
  struct ShiftView {
    static let shiftOverviewHeader: String = "Shift Overview";
    static let inspectionsHeader: String = "Inspections";
    static let addInspectionsLabel: String = "Add Inspection";
    static let blowbyHeader: String = "Blowbys";
    static let addBlowbyButtonLabel: String = "Add Blowby";
    static let shiftInformationHeader: String = "Shift Information"
    static let shiftStartHeader: String = "Shift Start";
    static let shiftStartLabel: String = "Shift Start Time:";
    static let shiftEndHeader: String = "Shift End";
    static let shiftEndLabel: String = "Shift End Time:";
    static let shiftStartComments: String = "Shift Start Comments:";
    static let shiftEndComments: String = "Shift End Comments:";
    static let stationLabel: String = "Station:";
    static let k9ShiftLabel: String = "K9 on Shift";
    static let boatsInspectedLabel: String = "Boats Inspected"
  }
  
  struct InspectionTable {
    static let idHeader: String = "ID";
    static let riskLevelHeader: String = "Risk Level";
    static let timeAddedHeader: String = "Time Added";
    static let statusLabel: String = "Status";
    static let emptyTable: String = "Inspections";
  }
  struct BlowbyTable {
    static let reportedToRapp: String = "Reported To Rapp";
    static let watercraftComplexity: String = "Watercraft Complexity";
    static let blowbyTime: String = "Blowby Time";
    static let deleteLabel: String = "Delete";
  }
}
