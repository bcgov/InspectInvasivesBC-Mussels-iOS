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
    ScrollView {
      Spacer()
      //MARK: Passport Holder Check
      Section(header: HeaderText(header: "Passport Information")) {
        HStack{
          InputTextLabel(text: "Is this a Passport Holder?")
          Toggle("Is this a Passport Holder?", isOn: $inspection.isPassportHolder).labelsHidden()
          Spacer()
        }
        // MARK: Passport Fields
        if(inspection.isPassportHolder){
          PassportInformation(inspection: inspection, isEditable: isEditable)
        }
      }.padding(.horizontal, Constants.basePadding)
      CustomDivider()
      
      //MARK: Basic information section
      Section(header: HeaderText(header: "Basic Information")) {
        VStack{
          HStack {
            VStack(alignment: .leading){
              CustomizedPicker(title: "Province/State of Boat Residence", value: $inspection.provinceOfResidence, options: ProvinceState)
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
            Picker("Source", selection: $inspection.previousAISKnowledgeSource) {
              ForEach(CleanDrainDryKnowledge, id: \.self) { option in
                Text(option)
              }
            }.disabled(!isEditable)
            Spacer()
          }
        }
        HStack{
          CustomizedSegmentedPicker(title: "Previous Inspection and/or agency notification", value: $inspection.previousInspection)
          Spacer()
        }
        if(inspection.previousInspection){
          VStack(alignment: .leading){
            HStack {
              InputTextLabel(text: "Source")
              Picker("Source", selection: $inspection.previousInspectionSource) {
                ForEach(PreviousInspectionSource, id: \.self) { option in
                  Text(option)
                }
              }.disabled(!isEditable)
              Spacer()
            }
            HStack {
              InputTextLabel(text: "No. of days")
              Picker("Source", selection: $inspection.previousInspectionDays) {
                ForEach(daysFromInspection, id: \.self) { option in
                  Text(option)
                }
              }.disabled(!isEditable)
              Spacer()
            }
          }
        }
      }.padding([.horizontal, .bottom], Constants.basePadding)
      CustomDivider()
      
      //MARK: Journey Details section
      Section(header: HeaderText(header: "Journey Details")) {
        VStack{
          HeaderText(header: "Previous Waterbody")
          VStack {
            NavigationLink(destination: WaterbodyPicker()) {
              Text("Add Previous Water Body")
            }
            NavigationLink(destination: MajorCityPicker()) {
              Text("Add Closest Major City")
            }
          }
          
          VStack {
            HeaderText(header: "Destination Waterbody")
            VStack() {
              NavigationLink(destination: WaterbodyPicker()) {
                Text("Add Destination Water Body")
              }.disabled(!isEditable
                         || inspection.commercialManufacturerAsPreviousWaterBody
                         || inspection.unknownPreviousWaterBody
                         || inspection.previousDryStorage
              )
              NavigationLink(destination: MajorCityPicker()) {
                Text("Add Closest Major City")
              }
            }
          }
        }
      }
      CustomDivider()
      
      //MARK: Inspection Details Section
      Section(header: HeaderText(header: "Inspection Details")) {
        
      }
      CustomDivider()
      
      //MARK: High Risk Assessment section
      HighRiskFields(inspection: inspection, isEditable: isEditable)
      CustomDivider()
      
      if(inspection.adultDreissenidFound || inspection.highriskAIS){
        Section(header: HeaderText(header: "High Risk Inspection Outcomes")){
          HighRiskInspectionOutcomes(inspection: inspection, isEditable: isEditable)
        }
      }
      //MARK: Inspection Comments section
      Section(header: HeaderText(header: "Comments")) {
        
      }
    }
    Spacer()
  }
}

#Preview {
  @State var inspection: InspectionModel = InspectionModel();
  inspection.isPassportHolder = true;
  let isEditable: Bool = true;
  return InspectionView(inspection: inspection, isEditable: isEditable);
}
