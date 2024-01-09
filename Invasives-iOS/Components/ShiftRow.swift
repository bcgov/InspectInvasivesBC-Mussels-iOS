//
//  ShiftRow.swift
//  Invasives-iOS
//
//  Created by Matthew Logan on 2024-01-09.
//

import SwiftUI
func formatDate(date: Date) -> String {
    let dateFormatter = DateFormatter()
    dateFormatter.dateFormat = "yyyy-MM-dd HH:mm:ss"
    return dateFormatter.string(from: date)
}
struct ShiftRow: View {
  @Binding var shift: ShiftModel;
    var body: some View {
      HStack{
        Spacer()
        Text("\(Int.random(in: 0..<100))")
        Spacer()
        Text(formatDate(date: shift.shiftStartDate))
        Spacer()
        Text(shift.station)
        Spacer()
        Text(shift.status.rawValue)
        Spacer()
      }.onTapGesture{
        print("Hello")
      }
    }
}

struct ShiftRow_Previews: PreviewProvider {
    @State static var shift = ShiftModel()
    
    static var previews: some View {
        ShiftRow(shift: $shift)
    }
}
