//
//  UserList.swift
//  SimpleRest
//
//  Created by Kentaro Mihara on 2023/08/02.
//

import SwiftUI

struct UserList: View{
    var size: CGSize
    @StateObject var viewModel: UserViewModel = .init()
    
    var body: some View{
        VStack(){
            ScrollView(.vertical, showsIndicators: false){
                VStack(spacing: 14){
                    ForEach(viewModel.repositories.users, id: \.user_id){el in
                        HStack(spacing: 4){
                            Text(el.user_id)
                            Text(el.name)
                            Text(el.group)
                        }
                    }
                }
            }
            
            Button{
                viewModel.addUsers(user_id: "M008", name: "Tobu", group: "D")
            }label:{
                Text("add user")
                    .fontWeight(.semibold)
                    .foregroundColor(.white)
                    .frame(width: size.width * 0.4)
                    .padding(.vertical, 15)
                    .background{
                        Capsule()
                            .fill(.black)
                    }
                
                
            }
        }
        .frame(maxWidth: .infinity, alignment: .center)
        .frame(maxHeight: .infinity, alignment: .center)
        
        
        
    }
}
