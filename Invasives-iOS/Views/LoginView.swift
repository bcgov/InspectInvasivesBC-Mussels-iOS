//
//  LoginView.swift
//  Invasives-iOS
//
//  Created by Matthew Logan on 2023-12-29.
//

import SwiftUI

struct LoginView: View {
  var minLengthConstraint: Int = 3;
  @Binding var loggedIn: Bool
  @State var username: String = ""
  @State var password: String = ""
  @State private var showAlert: Bool = false;
  var body: some View {
    VStack(){
      Spacer()
      Text("Invasives-iOS Application").font(.title);
      Spacer()
      VStack {
        VStack{
          HStack{
            Image(systemName: "figure.fishing").resizable().foregroundColor(.mint).scaledToFit()
          }
          HStack{
            Image(systemName: "water.waves").resizable().foregroundColor(.blue).scaledToFit()
            Image(systemName: "fish").resizable().foregroundColor(.blue).scaledToFit()
            Image(systemName: "water.waves").resizable().foregroundColor(.blue).scaledToFit()
          }
        }.frame(height: 125)
      }
      VStack{
        TextField("Username", text: $username).padding();
        SecureField("Password", text: $password).padding();
        Button( action: { VerifyLogin() }) { Text("Login") }
          .alert(isPresented: $showAlert) {
            Alert(
              title: Text("Invalid Login"),
              message: Text("Your supplied credentials were invalid, Try again!.\n(\(minLengthConstraint + 1) chars or longer for username + password"),
              dismissButton: .default(Text("OK"))
            )
          }
      }
      Spacer()
    }.padding()
  }
  func VerifyLogin() -> Void {
    if username.count > minLengthConstraint && password.count > minLengthConstraint {
      loggedIn.toggle()
    } else {
      showAlert = true
    }
  }
}



struct ContentView_Previews: PreviewProvider {
  static var previews: some View {
    PreviewWrapper()
  }
}

struct PreviewWrapper: View {
  @State var loggedIn: Bool = false;
  var body: some View {
    LoginView(loggedIn: $loggedIn)
  }
}
