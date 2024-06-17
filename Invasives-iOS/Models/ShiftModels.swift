//
//  ShiftModels.swift
//  Invasives-iOS
//
//  Created by Matthew Logan on 2024-05-17.
//

import Foundation
import SwiftUI
import os

/// class representing a collection of shifts centralizing the shifts being done.
class ShiftModels: ObservableObject, Codable {
    @Published var entries: [ShiftModel]
    
    static let documentsDirectory = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first!
    static let entriesURL = documentsDirectory.appendingPathComponent("entries").appendingPathExtension("json")
    
    init(previewMode: Bool = false) {
        entries = [ShiftModel]()
        loadObjects()
        if previewMode {
            entries.append(ShiftModel())
            entries.append(ShiftModel())
        }
    }
    
  // MARK: - Codable Requirements. Used to Persist Data on Application
    required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        entries = try container.decode([ShiftModel].self, forKey: .entries)
    }
    
    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(entries, forKey: .entries)
    }
    
    func loadObjects() {
        do {
            let data = try Data(contentsOf: ShiftModels.entriesURL)
            let decoder = JSONDecoder()
            entries = try decoder.decode([ShiftModel].self, from: data)
        } catch {
            print("Cannot load due to", error.localizedDescription)
        }
    }
    
    func saveObjects() {
        do {
            let encoder = JSONEncoder()
            let data = try encoder.encode(entries)
            try data.write(to: ShiftModels.entriesURL)
        } catch {
            print("Cannot save due to", error.localizedDescription)
        }
    }
    /// Creates a new Shift Model for the form
  ///
    func addNewShift() {
        DispatchQueue.main.async {
            self.entries.append(ShiftModel())
            self.saveObjects()
        }
    }

    private enum CodingKeys: String, CodingKey {
        case entries
    }
}
