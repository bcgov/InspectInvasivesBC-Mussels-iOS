//
//  ShiftView.swift
//  Invasives-iOS
//
//  Created by Matthew Logan on 2024-01-09.
//

import SwiftUI

struct ShiftView: View {
  @ObservedObject var shift: ShiftModel;
  
  var isEditable: Bool;
  
  var body: some View {
    // MARK: Title Section, displays Shift ID, Date, Status
    VStack{
      HStack{
        Text("ID: \(Int.random(in: 1..<99)) - \(shift.formattedDate(date: shift.shiftStartDate))").bold()
        shift.getStatusComponent()
        Spacer();
      }.padding()
      Divider()
        .background(Color.green)
        .padding(.horizontal)
      
      // MARK: Inspections Section
      Section(header: VStack{
        HStack{
          Text("Inspections").font(.system(size: 24)).padding(.leading)
          Spacer()
          if(isEditable){
            Image(systemName: "plus").foregroundColor(.blue);
            Button("Add Inspection", action: {
              print("Add Inspection Button");
            });
          }
        }
        Divider().background(Color.yellow)
          .padding(.horizontal)
      }
        .padding(.horizontal, 20))
      {
        EmptyTable(collection: "Inspections")
      }
      // MARK: Blowby Section
      Section(header: VStack{
        HStack{
          Text("Blowbys").font(.system(size: 24)).padding(.leading)
          Spacer()
          if(isEditable){
            Image(systemName: "plus").foregroundColor(.blue);
            Button("Add Blowby", action: {
              shift.addBlowby();
            });
          }
        }
        Divider().background(Color.yellow)
          .padding(.horizontal)
      }
        .padding(.horizontal, 20))
      {
        // MARK: Blowby Table
          if (shift.blowBys.count > 0) {
            BlowbyTable(blowBys: $shift.blowBys, isEditable: isEditable)
          } else {
            EmptyTable(collection: "Blowbys")
          }
        }
      
      /// Messing around values, Not final Product
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
            )
          }
          HStack{
            Text("Station:")
            TextField("Station", text: $shift.station
            )
          }
          Spacer()
        }.padding(.leading)
      }
    }
  }
}


#Preview{
  @State var shift = ShiftModel()
  return NavigationStack(){
    ShiftView(shift: shift, isEditable: shift.status != Status.Complete)
  }
}
