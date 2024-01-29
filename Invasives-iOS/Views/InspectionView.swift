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
    }.padding(.horizontal, 20)
    CustomDivider()
    
    //MARK: Basic information section
    Section(header: HeaderText(header: "Basic Information")) {
      
    }
    CustomDivider()
    
    //MARK: Watercraft Details section
    Section(header: HeaderText(header: "Watercraft Details")) {
      
    }
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
