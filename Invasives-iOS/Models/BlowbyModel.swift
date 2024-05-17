//
//  BlowbyModel.swift
//  Invasives-iOS
//
//  Created by Matthew Logan on 2024-01-09.
//

import Foundation


struct BlowbyModel: Identifiable, Codable {
    let id: UUID
    let userID: Int
    var blowByTime: Date
    var waterCraftComplexity: Complexity
    var reportedToRapp: Bool
    
    init(id: UUID = UUID(), userID: Int = -1, blowByTime: Date = Date(), waterCraftComplexity: Complexity = .NonMotorized, reportedToRapp: Bool = false) {
        self.id = id
        self.userID = userID
        self.blowByTime = blowByTime
        self.waterCraftComplexity = waterCraftComplexity
        self.reportedToRapp = reportedToRapp
    }
    
    func getFormattedTime(date: Date) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "hh:mm"
        return dateFormatter.string(from: date)
    }
}

