//
//  HighRiskFields.swift
//  Invasives-iOS
//
//  Created by Matthew Logan on 2024-06-26.
//  Copyright © 2024 Sustainment Team. All rights reserved.
//

import SwiftUI

/// High Risk Fields section triggers the Additional Fields when True
struct HighRiskFields: View {
  @ObservedObject var inspection: InspectionModel;
  let isEditable: Bool;
  let alertedLargerForm: Bool = false;
    var body: some View {
      VStack(alignment: .leading){
        HeaderText(header: "High Risk Assessment Fields").padding(.leading, -Constants.basePadding)
        CustomizedSegmentedPicker(title: "The watercraft is NOT Clean, Drain, Dry after full inspection and further action must be taken AND/OR a full inspection cannot be completed", value: $inspection.highriskAIS).padding(.bottom)
        CustomizedSegmentedPicker(title: "Adult Dreissenid Mussels Found?", value: $inspection.adultDreissenidFound)
      }
      .disabled(!isEditable)
      .padding(Constants.basePadding) // This makes Padding Inside of the border
      .overlay(RoundedRectangle(cornerRadius: 10).stroke(bcBlueColor))
      .padding() // This makes Padding outside of the border, the order is sequential
    }
}

#Preview {
    @State var inspection: InspectionModel = InspectionModel();
    let isEditable: Bool = true;
    return HighRiskFields(inspection: inspection, isEditable: isEditable)
}
