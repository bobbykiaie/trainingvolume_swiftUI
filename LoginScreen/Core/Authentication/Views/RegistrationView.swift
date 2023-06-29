//
//  RegistrationView.swift
//  LoginScreen
//
//  Created by Babak Kiaie on 6/26/23.
//

import SwiftUI

struct RegistrationView: View {
    @State private var email = ""
    @State private var fullName = ""
    @State private var password = ""
    @State private var confirmPassword = ""
    @State private var isSecureField = false
    @Environment(\.dismiss) var dismiss
    @EnvironmentObject var viewModel: AuthViewModel
    
    var body: some View {
        VStack(spacing: 30) {
            // image
            Image(systemName: "person.crop.circle.fill")
                .symbolRenderingMode(.hierarchical)
                .font(.system(size: 200))
                .foregroundColor(.gray)
            //form frields
            VStack(spacing: 24){
                InputView(text: $email, title: "Email Address", placeholder: "name@example.com",isSecureField: .constant(false))
                    .textInputAutocapitalization(.never)
                InputView(text: $fullName, title: "Full Name", placeholder: "John Doe", isSecureField: .constant(false))
                    .textInputAutocapitalization(.words)
                HStack{
                    InputView(text: $password, title: "Password", placeholder: "password", isSecureField: $isSecureField).textInputAutocapitalization(.never)
                    Button {
                        isSecureField.toggle()
                    } label: {
                        let eye = isSecureField ? "eye" : "eye.slash"
                        Image(systemName: eye)
                            .foregroundColor(.gray)
                    }

                }
                InputView(text: $password, title: "Confirm Password", placeholder: "password", isSecureField: .constant(true))
            }.padding(.horizontal)
                .padding(.top, 12)
            //sign in button
            Button {
                Task {
                    try await viewModel.createUser(withEmail: email,
                                                    password: password,
                                                    fullName: fullName)
                }
            } label: {
                HStack{
                    Text("SIGN UP")
                    Image(systemName: "arrow.right")
                }.frame(width: UIScreen.main.bounds.width - UIScreen.main.bounds.width*0.2)
            }.buttonStyle(.borderedProminent)
                .controlSize(.large)
                
            Spacer()
            //sign up button
            Button {
              dismiss()
            } label: {
                HStack{
                    Text("Already have an account?")
                    Text("Sign In")
                        .fontWeight(.bold)
                }.font(.footnote)
            }

        }
    }
}

struct RegistrationView_Previews: PreviewProvider {
    static var previews: some View {
        RegistrationView()
    }
}
