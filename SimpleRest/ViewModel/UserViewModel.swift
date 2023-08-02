//
//  UserViewModel.swift
//  SimpleRest
//
//  Created by Kentaro Mihara on 2023/08/02.
//

import Foundation
import Alamofire
import Combine

class UserViewModel: ObservableObject{
    @Published var repositories: UserRepositories = .init(users: [])
    
    init(){
        getUsers()
    }
    
    private func getUsers(){
        let url = "https://f95a-211-2-3-199.ngrok-free.app/Users"
        
        guard let url = URL(string: url) else{
            return
        }
        
        AF.request(url, method: .get).responseJSON{ response in
            if(response.response?.statusCode == 404){
                // do something when status code is 404
                print("404")
                return
            }
            
            guard let data = response.data else{
                return
            }
            
            do{
                let res = try JSONDecoder().decode(UserRepositories.self, from: data)
                self.repositories = res
            }catch{
                print(error)
            }
        }
    }
    
    
    public func addUsers(user_id: String, name: String, group: String){
        
        let url = "https://f95a-211-2-3-199.ngrok-free.app/Users"
        
        guard let url = URL(string: url) else{
            return
        }
        
        let param: Parameters = [
            "user_id": user_id,
            "name": name,
            "group": group
        ]
        
        let headers: HTTPHeaders = [
            "Content-Type": "application/json",
        ]
        
        AF.request(url, method: .post, parameters: param, encoding: JSONEncoding.default, headers: headers)
            .responseJSON{ response in
                if(response.response?.statusCode == 404){
                    print("404")
                    return
                }
                
                guard let data = response.data else{
                    print("failed")
                    return
                }
                
                do{
                    let res = try JSONDecoder().decode(UserRepositories.self, from: data)
                    self.repositories = res
                }catch{
                    print(error)
                    
                }
                
            }
        
    }
    
}

