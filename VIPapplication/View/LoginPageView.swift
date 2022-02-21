//
//  LoginPageView.swift
//  VIPapplication
//
//  Created by Braeden Meikle on 2/13/22.
//

import SwiftUI
import Firebase

struct LoginPageView: View {
    
    @State private var username: String = ""
    @State private var password: String = ""
    @State private var showAlert = false
    let incorrectLogin: String = "Incorrect username or password!"
    @State private var successfulLogin = true
    
    // login function for Firebase
    func logIn() {
        Auth.auth().signIn(withEmail: username, password: password) { (result, error) in
            if error != nil {
                // show text on screen saying incorrect username or password
                successfulLogin = false;
            } else {
                print("You signed in")
                successfulLogin = true // set it back to false because login was successful
            }
        }
    }
    
    var body: some View {
        VStack {
            Text("LOG IN")
                .padding(.bottom, 100)
                .font(.custom("PTMono-Regular", size: 36))
            
            if !successfulLogin {
                Text(incorrectLogin)
                    .font(.custom("PTMono-Regular", size: 18))
                    .foregroundColor(.red)
            }
            
            ZStack {
                TextField(
                       "Username",
                       text: $username
                )
                    .frame(width: 170, height: 20, alignment: .center)
                    .padding()
                    .background(Color(.systemGray6))
                    .font(.custom("PTMono-Regular", size: 18)).multilineTextAlignment(.center)
            }
            
            ZStack {
                TextField(
                       "Password",
                       text: $password
                )
                    .frame(width: 170, height: 20, alignment: .center)
                    .padding()
                    .background(Color(.systemGray6))
                    .font(.custom("PTMono-Regular", size: 18)).multilineTextAlignment(.center)
            }
            
            ZStack {
                Rectangle()
                    .fill(Color.green)
                    .frame(width: 200, height: 60)
                /*NavigationLink(destination: HomePageView()) {
                    Text("LOG IN")
                        .font(.custom("PTMono-Regular", size: 18))
                        .foregroundColor(.white)*/
                Button("LOG IN") {
                    logIn()
                }
                    .font(.custom("PTMono-Regular", size: 18))
                    .foregroundColor(.white)
                
            }.navigationBarBackButtonHidden(true)
                .padding(.bottom, 10)
            
            NavigationLink(destination: ResetPasswordView()) {
                Text("Forgot password?")
                    .font(.custom("PTMono-Regular", size: 18))
                    .foregroundColor(.black)
            }.navigationBarBackButtonHidden(true)
                .padding(.bottom, 100)
            
            HStack {
                Text("Don't have an account? ")
                    .font(.custom("PTMono-Regular", size: 18))
                    .padding(-8)
                NavigationLink(destination: SignUpView()) {
                    Text("Sign up")
                        .font(.custom("PTMono-Regular", size: 18))
                        .foregroundColor(.black)
                }
            }
        }
    }
}

struct LoginPageView_Previews: PreviewProvider {
    static var previews: some View {
        LoginPageView()
    }
}
