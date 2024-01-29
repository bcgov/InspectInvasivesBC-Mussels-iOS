//
//  InspectionView.swift
//  Invasives-iOS
//
//  Created by Matthew Logan on 2023-12-29.
//

import SwiftUI

struct InspectionView: View {
  @ObservedObject var inspection: InspectionModel;
  let isEditable: Bool;
  var body: some View {
    //MARK: Passport Holder Check
    Section(header: HeaderText(header: "Passport Information")) {
      HStack{
        InputTextLabel(text: "Is this a Passport Holder?")
        Toggle("Is this a Passport Holder?", isOn: $inspection.isPassportHolder).labelsHidden()
        Spacer()
      }
      if(inspection.isPassportHolder){
        Text("Is a Passport Holder")
      }
    }.padding(.horizontal, Constants.basePadding)
    CustomDivider()
    
    //MARK: Basic information section
      Section(header: HeaderText(header: "Basic Information")) {
        VStack{
          HStack {
            VStack(alignment: .leading){
              InputTextLabel(text: "Province/State of Boat Residence")
              Picker("ProvinceStateLabel", selection: $inspection.provinceOfResidence){
                ForEach(ProvinceState, id: \.self) { option in
                  Text(option)}
              }
              .disabled(!isEditable)
              .labelsHidden()
              .background(inputBackgroundColor)
            }
            Spacer().frame(width: 50)
            VStack(alignment: .leading){
              InputTextLabel(text: "Time of Inspection")
              DatePicker("Time of Inspection", selection: $inspection.inspectionTime, displayedComponents: .hourAndMinute).labelsHidden()
            }
          }.padding(.horizontal, Constants.basePadding)
          Grid {
            GridRow{
              CustomizedIntStepper(title: "Non-Motorized", step: $inspection.nonMotorized)
              CustomizedIntStepper(title: "Simple", step: $inspection.simple)
              CustomizedIntStepper(title: "Complex", step: $inspection.complex)
              CustomizedIntStepper(title: "Very Complex", step: $inspection.veryComplex)
            }
          }.padding(.horizontal, Constants.basePadding)
        }
    }
    CustomDivider()
    
    //MARK: Watercraft Details section
    Section(header: HeaderText(header: "Watercraft Details")) {
      HStack{
        CustomizedIntStepper(title: "Number of people in the party", step: $inspection.numberOfPeopleInParty)
        Spacer().frame(width: 100)
        CustomizedSegmentedPicker(title: "Watercraft/equipment commercially hauled", value: $inspection.commerciallyHauled)
        Spacer()
      }
      HStack{
        CustomizedSegmentedPicker(title: "Previous Knowledge of AIS or Clean, Drain, Dry", value: $inspection.previousAISKnowledge)
        Spacer()
      }
      if(inspection.previousAISKnowledge){
        HStack{
          InputTextLabel(text: "Source")
          Picker("Source", selection: $inspection.previousInspectionSource) {
            ForEach(CleanDrainDryKnowledge, id: \.self) { option in
              Text(option)
            }
          }.disabled(!isEditable)
          Spacer()
        }
      }
    }.padding([.horizontal, .bottom], Constants.basePadding)
    CustomDivider()
    
    //MARK: Journey Details section
    Section(header: HeaderText(header: "Journey Details")) {
      Spacer().frame(height: 40)
      VStack{
        HeaderText(header: "Previous Waterbody")
        VStack {
          Text("Previous Details")
        }
        HeaderText(header: "Destination Waterbody")
        VStack {
          Text("Destination Details")
        }
      }
    }
    CustomDivider()
    
    //MARK: Inspection Details Section
    Section(header: HeaderText(header: "Inspection Details")) {
      
    }
    CustomDivider()
    
    //MARK: High Risk Assessment section
    Section(header: HeaderText(header: "High Risk Assessment Fields")) {
      
    }
    CustomDivider()
    
    //MARK: Inspection Comments section
    Section(header: HeaderText(header: "Comments")) {
      
    }
    Spacer()
  }
}

#Preview {
  @State var inspection: InspectionModel = InspectionModel();
  let isEditable: Bool = true;
  return InspectionView(inspection: inspection, isEditable: isEditable);
}
