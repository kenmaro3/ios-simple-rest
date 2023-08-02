//
//  ContentView.swift
//  SimpleRest
//
//  Created by Kentaro Mihara on 2023/08/02.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        GeometryReader{
            let size = $0.size
            UserList(size: size)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
