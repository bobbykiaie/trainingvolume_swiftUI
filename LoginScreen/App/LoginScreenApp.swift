//
//  LoginScreenApp.swift
//  LoginScreen
//
//  Created by Babak Kiaie on 6/26/23.
//

import SwiftUI
import Firebase

@main
struct LoginScreenApp: App {
    @StateObject var viewModel = AuthViewModel()
    
    init() {
        FirebaseApp.configure()
    }
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(viewModel)
        }
    }
}
