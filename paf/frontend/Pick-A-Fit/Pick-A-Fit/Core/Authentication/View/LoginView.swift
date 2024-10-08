//
//  LoginView.swift
//  Pick-A-Fit
//
//  Created by Graceson Thompson on 2/13/24.
//

import SwiftUI

struct LoginView: View {
    @State private var email = ""
    @State private var password = ""
    @EnvironmentObject var viewModel: AuthViewModel

    var body: some View {
        NavigationStack{
            VStack{
                //image
                Image("logo")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 200,height:200 )
                    .padding(.vertical, 32)
                
                //form fields
                VStack(spacing: 24){
                    InputView(text: $email,
                              title: "Email Address",
                              placeholder: "name@example/com")
                    .textInputAutocapitalization(.never)
                    
                    InputView(text: $password,
                              title: "Password",
                              placeholder: "Enter your password",
                              isSecureField: true)
                    .textInputAutocapitalization(.never)
                }
                .padding(.horizontal)
                .padding(.top,12)
        
                
                //sign in button
                
                Button{
                    Task{
                       try await viewModel.signIn(withEmail: email, password: password)
                    }
                }label: {
                    HStack{
                        Text("SIGN IN")
                            .fontWeight(.semibold)
                        Image(systemName: "arrow.right")
                    }
                    .foregroundStyle(.white)
                    .frame(width: UIScreen.main.bounds.width - 32,height: 48)
                }
                .background(.blue)
                .cornerRadius(10)
                .padding(.top,24)

                Spacer()
                
                //sign up button
                NavigationLink{
                    RegistrationView()
                } label: {
                    HStack{
                        Text("Don't have an account?")
                        Text("Sign Up")
                            .fontWeight(.bold)
                    }
                    .font(.system(size: 16))
                }
            }
            
        }
    }
}

#Preview {
    LoginView()
}
