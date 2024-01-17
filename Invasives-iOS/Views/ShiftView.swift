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
  var customColor: Color = Color(red: 238/255, green: 237/255, blue: 231/255)
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
      Spacer()
      HStack{
        Text("Shift Information").font(.system(size: 24)).padding(.leading)
        Spacer()
      }.padding(.horizontal, 20)
      Divider()
        .background(Color.yellow)
        .padding([.horizontal, .bottom], 20)
  
      Section(header: VStack{
        HStack{
          Text("Shift Start").font(.system(size: 24)).padding(.leading)
          Spacer()
        }
      }.padding(.horizontal, 20))
      {
        VStack{
          HStack{
            Text("Shift Start Time:")
            DatePicker("Shift Start Time", selection: $shift.shiftStartDate).labelsHidden()
            Spacer()
            Text("Station:")
            Picker("Station", selection: $shift.station) {
              ForEach(Stations, id: \.self) { option in
                Text(option)
              }
            }.disabled(!isEditable)
          }
          HStack(alignment: .top) {
            Text("Shift Start Comments:")
            TextField("Label", text: $shift.shift_start_comment, axis: .vertical)
              .scrollContentBackground(.hidden)
              .background(Color(red: 238/255, green: 237/255, blue: 231/255))
            
          }
        }.padding(.horizontal, 50)
      }
      Spacer().frame(height: 50)
      Section(header: VStack{
        HStack{
          Text("Shift End").font(.system(size: 24)).padding(.leading)
          Spacer()
        }
      }.padding(.horizontal, 20))
      {
        VStack{
          HStack{
            Text("Shift End Time:")
            DatePicker("Shift End Time", selection: $shift.shiftStartDate, displayedComponents: .hourAndMinute).labelsHidden()
            Spacer()
            Text("\(Image(systemName: "dog.fill")) K9 on Shift")
            Toggle(isOn: $shift.k9_on_shift){
              Text(Image(systemName: "dog.fill"))
            }.labelsHidden()
            Spacer()
            Text("\(Image(systemName: "sailboat.fill")) Boats Inspected")
            Toggle(isOn: $shift.boats_inspected_during_shift){
              Text("\(Image(systemName: "sailboat.fill")) Boats Inspected")
            }.labelsHidden()
            Spacer()
            
          }
          HStack(alignment: .top) {
            Text("Shift End Comments:")
            TextField("", text: $shift.shift_end_comment, axis: .vertical)
              .scrollContentBackground(.hidden)
              .background(customColor)
            
          }
        }.padding(.horizontal, 50)
      }
      /// Messing around values, Not final Product
      HStack{
        VStack(alignment: .leading){
          Spacer()
          HStack{
            Text("Shift Status:")
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
