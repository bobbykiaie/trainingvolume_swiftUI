//
//  InputView.swift
//  LoginScreen
//
//  Created by Babak Kiaie on 6/26/23.
//

import SwiftUI

struct InputView: View {
    @Binding var text: String
    let title: String
    let placeholder: String
    @Binding var isSecureField: Bool
    
    var body: some View {
        VStack(alignment: .leading, spacing: 12){
            Text(title)
                .foregroundColor(Color(.darkGray))
                .fontWeight(.semibold)
                .font(.footnote)
            
            if isSecureField {
                SecureField(placeholder, text: $text)
                    .font(.system(size: 14))
            } else {
                TextField(placeholder, text: $text)
                    .font(.system(size: 14))
            }
        
        }
    }
}

struct InputView_Previews: PreviewProvider {
    
    
    static var previews: some View {
        InputView(text: .constant(""), title: "Email Address", placeholder: "name@example.com", isSecureField: .constant(false))
    }
}
