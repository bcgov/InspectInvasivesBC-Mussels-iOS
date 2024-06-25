//
//  PassportInformation.swift
//  Invasives-iOS
//
//  Created by Matthew Logan on 2024-06-25.
//  Copyright © 2024 Sustainment Team. All rights reserved.
//

import SwiftUI

struct PassportInformation: View {
  @ObservedObject var inspection: InspectionModel;
  let isEditable: Bool;
  var body: some View {
    VStack(alignment: .leading){
      VStack(alignment: .leading){
        InputTextLabel(text: StringConstants.Passport.newPassportIssued);
        Toggle(StringConstants.Passport.newPassportIssued, isOn: $inspection.isNewPassportIssued).labelsHidden()
      }
      HStack {
        VStack(alignment: .leading){
          InputTextLabel(text: StringConstants.Passport.inspectionTime)
          DatePicker(StringConstants.Passport.inspectionTime, selection: $inspection.inspectionTime, displayedComponents: .hourAndMinute).labelsHidden()
        }
        VStack(alignment: .leading) {
          InputTextLabel(text: StringConstants.Passport.passportNumber)
          TextField(StringConstants.Passport.passportNumber, text: $inspection.passportNumber)
            .scrollContentBackground(.hidden)
            .background(inputBackgroundColor)
            .labelsHidden()
            .frame(width: 225)
        }
        VStack(alignment: .leading){
          InputTextLabel(text: StringConstants.Passport.launchedOutsideBC)
          Toggle(StringConstants.Passport.launchedOutsideBC, isOn: $inspection.launchedOutsideBC).labelsHidden()
        }
        Spacer()
      }
      HStack{
        CustomizedSegmentedPicker(title: StringConstants.Passport.k9InspectionPerformed, value: $inspection.k9Inspection)
        if(inspection.k9Inspection){
          VStack{
            CustomizedPicker(title: StringConstants.Passport.k9Results, value: $inspection.k9InspectionResults, options: k9Results)
            }
        }
        VStack(alignment: .leading){
          InputTextLabel(text: StringConstants.Passport.marineSpeciesFound)
          Toggle(StringConstants.Passport.marineSpeciesFound, isOn: $inspection.marineSpeciesFound).labelsHidden()
        }
        VStack(alignment: .leading){
          InputTextLabel(text: StringConstants.Passport.aquaticPlantsFound)
          Toggle(StringConstants.Passport.aquaticPlantsFound, isOn: $inspection.aquaticPlantsFound).labelsHidden()
        }
      }.padding(.vertical)
      VStack(alignment: .leading) {
        InputTextLabel(text: StringConstants.Passport.decontaminationPerformed)
        Toggle(StringConstants.Passport.decontaminationPerformed, isOn: $inspection.decontaminationPerformed).labelsHidden()
      }
    }.padding().disabled(!isEditable)
  }
}

#Preview {
  @State var inspection: InspectionModel = InspectionModel();
  inspection.isPassportHolder = true;
  let isEditable: Bool = true;
  return PassportInformation(inspection: inspection, isEditable: isEditable);
}
