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
          HeaderText(header: StringConstants.ShiftView.shiftOverviewHeader)
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
          HeaderText(header: StringConstants.ShiftView.inspectionsHeader)
          Spacer()
          if(isEditable){
            Image(systemName: StringConstants.AppIcon.addIcon).foregroundColor(.blue);
            Button(StringConstants.ShiftView.addInspectionsLabel, action: {
              shift.addInspection();
            });
          }
        }
        CustomDivider()
      }
        .padding(.horizontal, 20))
      {
        InspectionTable(inspections: $shift.boatsInspected, isEditable: isEditable)
      }
      // MARK: Blowby Section
      Section(header: VStack{
        HStack{
          HeaderText(header: StringConstants.ShiftView.blowbyHeader)
          Spacer()
          if(isEditable){
            Image(systemName: StringConstants.AppIcon.addIcon).foregroundColor(.blue);
            Button(StringConstants.ShiftView.addBlowbyButtonLabel, action: {
              shift.addBlowby();
            });
          }
        }
        CustomDivider()
      }
        .padding(.horizontal, 20))
      {
        // MARK: Blowby Table
        BlowbyTable(blowBys: $shift.blowBys, isEditable: isEditable)
      }
      Spacer()
      HStack{
        HeaderText(header: StringConstants.ShiftView.shiftInformationHeader)
        Spacer()
      }.padding(.horizontal, 20)
      CustomDivider()
        .padding([.horizontal, .bottom], 20)
      
      Section(header: VStack{
        HStack{
          HeaderText(header: StringConstants.ShiftView.shiftStartHeader)
          Spacer()
        }
      }.padding(.horizontal, 20))
      {
        VStack{
          HStack{
            InputTextLabel(text: StringConstants.ShiftView.shiftStartLabel)
            DatePicker(StringConstants.ShiftView.shiftStartLabel, selection: $shift.shiftStartDate).labelsHidden()
            Spacer()
            InputTextLabel(text: StringConstants.ShiftView.stationLabel)
            Picker(StringConstants.ShiftView.stationLabel, selection: $shift.station) {
              ForEach(Stations, id: \.self) { option in
                Text(option)
              }
            }.disabled(!isEditable)
          }
          HStack(alignment: .top) {
            InputTextLabel(text: StringConstants.ShiftView.shiftStartComments)
            TextField(StringConstants.ShiftView.shiftStartComments, text: $shift.shift_start_comment, axis: .vertical)
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
          HeaderText(header: StringConstants.ShiftView.shiftEndHeader)
          Spacer()
        }
      }.padding(.horizontal, 20))
      {
        VStack{
          HStack{
            InputTextLabel(text: StringConstants.ShiftView.shiftEndLabel)
            DatePicker(StringConstants.ShiftView.shiftEndLabel, selection: $shift.shiftEndDate, displayedComponents: .hourAndMinute)
              .labelsHidden()
            Spacer()
            Image(systemName: StringConstants.AppIcon.k9OnShift)
            InputTextLabel(text: StringConstants.ShiftView.k9ShiftLabel)
            Toggle(isOn: $shift.k9_on_shift){
              Text(Image(systemName: StringConstants.AppIcon.k9OnShift))
            }.labelsHidden()
            Spacer()
            Image(systemName: StringConstants.AppIcon.boatsInspected)
            InputTextLabel(text: StringConstants.ShiftView.boatsInspectedLabel)
            Toggle(isOn: $shift.boats_inspected_during_shift){
              Image(systemName: StringConstants.AppIcon.boatsInspected)
              InputTextLabel(text: StringConstants.ShiftView.boatsInspectedLabel)
            }.labelsHidden()
            Spacer()
            
          }
          HStack(alignment: .top) {
            InputTextLabel(text: StringConstants.ShiftView.shiftEndComments)
            TextField(StringConstants.ShiftView.shiftEndComments, text: $shift.shift_end_comment, axis: .vertical)
              .scrollContentBackground(.hidden)
              .background(inputBackgroundColor)
              .labelsHidden()
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
