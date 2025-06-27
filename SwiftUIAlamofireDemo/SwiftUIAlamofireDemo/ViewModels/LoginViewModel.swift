//
//  LoginViewModel.swift
//  SwiftUIAlamofireDemo
//
//  Created by Admin on 27/06/25.
//

import Foundation
class LoginViewModel: ObservableObject {
    @Published var users: [User] = []
    @Published var isLoading = false
    @Published var errorMessage: String?
    
    func getUsers() {
            isLoading = true
            errorMessage = nil
            
            LoginService.shared.fetchUsers { [weak self] result in
                DispatchQueue.main.async {
                    self?.isLoading = false
                    switch result {
                    case .success(let users):
                        self?.users = users
                    case .failure(let error):
                        self?.errorMessage = error.localizedDescription
                    }
                }
            }
        }
}
