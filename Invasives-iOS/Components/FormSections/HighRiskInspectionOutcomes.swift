//
//  HighRiskInspectionOutcomes.swift
//  Invasives-iOS
//
//  Created by Matthew Logan on 2024-06-27.
//  Copyright © 2024 Sustainment Team. All rights reserved.
//

import SwiftUI

struct HighRiskInspectionOutcomes: View {
  @ObservedObject var inspection: InspectionModel
  let isEditable: Bool;
  var body: some View {
    HStack{
      VStack(alignment: .leading) {
        CustomizedSegmentedPicker(title: "Standing water present?", value: $inspection.highRiskInspectionOutcomes.standingWaterPresent)
        if(inspection.highRiskInspectionOutcomes.standingWaterPresent) {
          CustomizedStructuredList(title: "Standing water locations", array: $inspection.highRiskInspectionOutcomes.standingWaterLocation, options: standingLocations)
        }
        CustomizedSegmentedPicker(title: "Adult dreissenid mussels found?", value: $inspection.highRiskInspectionOutcomes.adultDreissenidMusselsFound)
        if (inspection.highRiskInspectionOutcomes.adultDreissenidMusselsFound){
          CustomizedStructuredList(title: "Adult Dreissenid mussels location", array: $inspection.highRiskInspectionOutcomes.adultDreissenidMusselsLocation, options: standingLocations)
        }
        CustomizedPicker(title: "Other inspection findings?", value: $inspection.highRiskInspectionOutcomes.otherInspectionFindings, options: otherInspectionFindings)
        CustomizedSegmentedPicker(title: "Decontamination performed?", value: $inspection.highRiskInspectionOutcomes.decontaminationPerformed)
        if(inspection.highRiskInspectionOutcomes.decontaminationPerformed ){
          CustomizedTextInput(title: "Record of Decontamination Number", text: $inspection.highRiskInspectionOutcomes.decontaminationReference)
        }
        CustomizedSegmentedPicker(title: "Decontamination order issued", value: $inspection.highRiskInspectionOutcomes.decontaminationOrderIssued)
        if(inspection.highRiskInspectionOutcomes.decontaminationOrderIssued){
          HStack {
            CustomNumberPicker(title: "Decontamination order number", value: $inspection.highRiskInspectionOutcomes.decontaminationOrderNumber)
          }
        }
        CustomizedSegmentedPicker(title: "Appendix B completed and served?", value: $inspection.highRiskInspectionOutcomes.decontaminationAppendixB)
        CustomizedSegmentedPicker(title: "Seal issued or existing seal?", value: $inspection.highRiskInspectionOutcomes.sealIssued)
        CustomizedSegmentedPicker(title: "Quarantine period issued?", value: $inspection.highRiskInspectionOutcomes.quarantinePeriodIssued)
      }
      Spacer()
    }
    .disabled(!isEditable)
    .padding(Constants.basePadding)
  }
}

#Preview {
  @State var inspection: InspectionModel = InspectionModel()
  @State var isEditable: Bool = true
  return HighRiskInspectionOutcomes(inspection: inspection, isEditable: isEditable)
}
