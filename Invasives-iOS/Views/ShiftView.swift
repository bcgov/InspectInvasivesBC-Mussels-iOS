//
//  ShiftView.swift
//  Invasives-iOS
//
//  Created by Matthew Logan on 2024-01-09.
//

import SwiftUI

struct ShiftView: View {
  @Binding var shift: ShiftModel;
    var body: some View {
      VStack{
        HStack{
          Text("Shift View").bold()
          Text("Your Shift ID: \(shift.shiftID.uuidString)")
        }
        HStack{
          VStack(alignment: .leading){
            HStack{
              Text("Shift Status:")
              Picker("Status of Shift", selection: $shift.status){
                ForEach(Status.allCases, id: \.self) { option in
                  Text(option.rawValue)}
              }
            }
            HStack{
              Text("Shift Start Comment:")
              TextField("Start Comment", text: $shift.shift_start_comment
              ).background(Color(UIColor.lightGray))
            }
            HStack{
              Text("Station:")
              TextField("Station", text: $shift.station
              ).background(Color(UIColor.lightGray))
            }
            Spacer()
          }.padding(.leading)
        }
      }
    }
}


struct ShiftView_Previews: PreviewProvider {
    @State static var shift = ShiftModel()
    
    static var previews: some View {
        ShiftView(shift: $shift)
    }
}
