//
//  ProfileView.swift
//  LoginScreen
//
//  Created by Babak Kiaie on 6/26/23.
//

import SwiftUI

struct ProfileView: View {
    @EnvironmentObject var viewModel: AuthViewModel
    
    var body: some View {
        if let user = viewModel.currentUser {
            List{
                Section {
                    HStack {
                        Text(user.intials)
                            .font(.title)
                            .fontWeight(.semibold)
                            .foregroundColor(.white)
                            .frame(width: 80, height: 80)
                            .background(Color(.systemGray3))
                        .clipShape(Circle())
                        VStack(alignment: .leading){
                            Text(user.fullName)
                                .fontWeight(.semibold)
                                .padding(.top, 4)
                            Text(user.email)
                                .font(.footnote)
                                .tint(.gray)
                        }
                    }
                    
                }
                Section("General") {
                    HStack {
                        SettingsRowView(imageName: "gear", title: "Version", tintColor: Color(.systemGray))
                        Spacer()
                        Text("1.0.0")
                            .font(.subheadline)
                    }
                   
                }
                Section("Account"){
                    Button {
                        
                        viewModel.signOut()
                        
                    } label: {
                        SettingsRowView(imageName: "arrow.left.circle.fill", title: "Sign Out", tintColor: .red)
                    }
                    Button {
                        print("Delete Account")
                    } label: {
                        SettingsRowView(imageName: "xmark.circle.fill", title: "Delete Account", tintColor: .red)
                    }

                }
            }
        }
    }
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView()
    }
}
