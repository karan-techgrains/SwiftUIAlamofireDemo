//
//  LoginService.swift
//  SwiftUIAlamofireDemo
//
//  Created by Admin on 27/06/25.
//

import Foundation
import Alamofire

class LoginService {
    static let shared = LoginService()
    private init() {}
    
    func fetchUsers(completion: @escaping (Result<[User], AFError>) -> Void) {
            let url = "https://jsonplaceholder.typicode.com/users"

            AF.request(url)
                .validate()
                .responseDecodable(of: [User].self) { response in
                    completion(response.result)
                }
        }
}
