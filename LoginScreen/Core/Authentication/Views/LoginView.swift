//
//  LoginVIew.swift
//  LoginScreen
//
//  Created by Babak Kiaie on 6/26/23.
//

import SwiftUI

struct LoginView: View {
    @State private var email = ""
    @State private var password = ""
    @EnvironmentObject var viewModel: AuthViewModel
    @State private var isSecureField = true
    
    var body: some View {
        NavigationStack {
            VStack(spacing: 40) {
                // image
                Image(systemName: "person.crop.circle.fill")
                    .symbolRenderingMode(.hierarchical)
                    .font(.system(size: 200))
                    .foregroundColor(.gray)
                //form frields
                VStack(spacing: 24){
                    InputView(text: $email, title: "Email Address", placeholder: "name@example.com", isSecureField: .constant(false))
                        .textInputAutocapitalization(.never)
                    Divider()
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
                    Divider()
                }.padding(.horizontal)
                    .padding(.top, 12)
                //sign in button
                Button {
                    Task{
                        try await viewModel.signIn(withEmail: email, password: password  )
                    }
                   
                } label: {
                    HStack{
                        Text("SIGN IN")
                        Image(systemName: "arrow.right")
                    }.frame(width: UIScreen.main.bounds.width - UIScreen.main.bounds.width*0.2)
                }.buttonStyle(.borderedProminent)
                    .controlSize(.large)
                    
                    
                Spacer()
                //sign up button
                NavigationLink {
                    RegistrationView()
                } label: {
                    HStack{
                        Text("Dont have an account?")
                        Text("Sign Up")
                            .fontWeight(.bold)
                    }.font(.footnote)
                }
            }
        }
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
