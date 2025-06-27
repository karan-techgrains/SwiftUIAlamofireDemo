//
//  ContentView.swift
//  SwiftUIAlamofireDemo
//
//  Created by Admin on 27/06/25.
//

import SwiftUI

struct LoginView: View {
    @StateObject private var loginViewModel = LoginViewModel()
    
    var body: some View {
            NavigationView {
                Group {
                    if loginViewModel.isLoading {
                        ProgressView("Loading...")
                    } else if let error = loginViewModel.errorMessage {
                        Text("Error: \(error)")
                            .foregroundColor(.red)
                    } else {
                        List(loginViewModel.users) { user in
                            VStack(alignment: .leading) {
                                Text(user.name).font(.headline)
                                Text(user.email).font(.subheadline).foregroundColor(.gray)
                            }
                        }
                    }
                }
                .navigationTitle("Users")
                .onAppear {
                    loginViewModel.getUsers()
                }
            }
        }
}

#Preview {
    LoginView()
}
