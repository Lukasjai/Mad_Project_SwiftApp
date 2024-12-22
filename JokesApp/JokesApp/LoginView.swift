//
//  LoginView.swift
//  JokesApp
//
//  Created by lukas jaiczay on 22.12.24.
//

import SwiftUI

struct LoginView: View {
    var onLoginSuccess: () -> Void

    @State private var email = ""
    @State private var password = ""
    @State private var loginFailed = false

    let adminEmail = "admin"
    let adminPassword = "admin"

    var body: some View {
        VStack(spacing: 20) {
            Text("Login")
                .font(.largeTitle)

            TextField("Email", text: $email)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .autocapitalization(.none)

            SecureField("Password", text: $password)
                .textFieldStyle(RoundedBorderTextFieldStyle())

            Button("Login") {
                if email == adminEmail && password == adminPassword {
                    onLoginSuccess()
                } else {
                    loginFailed = true
                }
            }

            if loginFailed {
                Text("Login failed. Please try again.")
                    .foregroundColor(.red)
            }
        }
        .padding()
    }
}

