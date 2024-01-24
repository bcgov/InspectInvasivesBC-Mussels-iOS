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
      Section( header: VStack {
        HStack{
          HeaderText(header: "Shift Overview")
          Spacer()
        }
        CustomDivider()
      }){
        HStack{
          Text("ID: \(Int.random(in: 1..<99)) - \(shift.formattedDate(date: shift.shiftStartDate))").bold()
          shift.getStatusComponent()
          Spacer();
        }.padding()
      }.padding(.horizontal, 20)

      
      // MARK: Inspections Section
      Section(header: VStack{
        HStack{
          HeaderText(header: "Inspections")
          Spacer()
          if(isEditable){
            Image(systemName: "plus").foregroundColor(.blue);
            Button("Add Inspection", action: {
              print("Add Inspection Button");
            });
          }
        }
        CustomDivider()
      }
        .padding(.horizontal, 20))
      {
        EmptyTable(collection: "Inspections")
      }
      // MARK: Blowby Section
      Section(header: VStack{
        HStack{
          HeaderText(header: "Blowbys")
          Spacer()
          if(isEditable){
            Image(systemName: "plus").foregroundColor(.blue);
            Button("Add Blowby", action: {
              shift.addBlowby();
            });
          }
        }
        CustomDivider()
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
      Spacer()
      HStack{
        HeaderText(header: "Shift Information")
        Spacer()
      }.padding(.horizontal, 20)
      CustomDivider()
        .padding([.horizontal, .bottom], 20)
  
      Section(header: VStack{
        HStack{
          HeaderText(header: "Shift Start")
          Spacer()
        }
      }.padding(.horizontal, 20))
      {
        VStack{
          HStack{
            InputTextLabel(text: "Shift Start Time:")
            DatePicker("Shift Start Time", selection: $shift.shiftStartDate).labelsHidden()
            Spacer()
            InputTextLabel(text: "Station:")
            Picker("Station", selection: $shift.station) {
              ForEach(Stations, id: \.self) { option in
                Text(option)
              }
            }.disabled(!isEditable)
          }
          HStack(alignment: .top) {
            InputTextLabel(text: "Shift Start Comments:")
            TextField("Label", text: $shift.shift_start_comment, axis: .vertical)
              .scrollContentBackground(.hidden)
              .background(inputBackgroundColor)
            
          }
        }.padding(.horizontal, 50)
      }
      Spacer().frame(height: 50)
      CustomDivider()
        .padding([.horizontal, .bottom], 20)
      Section(header: VStack{
        HStack{
          HeaderText(header: "Shift End")
          Spacer()
        }
      }.padding(.horizontal, 20))
      {
        VStack{
          HStack{
            InputTextLabel(text: "Shift End Time:")
            DatePicker("Shift End Time", selection: $shift.shiftEndDate, displayedComponents: .hourAndMinute).labelsHidden()
            Spacer()
            Image(systemName: "dog.fill")
            InputTextLabel(text: "K9 on Shift")
            Toggle(isOn: $shift.k9_on_shift){
              Text(Image(systemName: "dog.fill"))
            }.labelsHidden()
            Spacer()
            Image(systemName: "sailboat.fill")
            InputTextLabel(text: "Boats Inspected")
            Toggle(isOn: $shift.boats_inspected_during_shift){
              Image(systemName: "sailboat.fill")
              InputTextLabel(text: "Boats Inspected")
            }.labelsHidden()
            Spacer()
            
          }
          HStack(alignment: .top) {
            InputTextLabel(text: "Shift End Comments:")
            TextField("", text: $shift.shift_end_comment, axis: .vertical)
              .scrollContentBackground(.hidden)
              .background(inputBackgroundColor) 
          }
        }.padding(.horizontal, 50)
      }
      /// Messing around values, Not final Product
      HStack{
        VStack(alignment: .leading){
          Spacer()
          HStack{
            InputTextLabel(text: "Shift Status:")
            Picker("Status of Shift", selection: $shift.status){
              ForEach(Status.allCases, id: \.self) { option in
                Text(option.rawValue)}
            }
          }
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
