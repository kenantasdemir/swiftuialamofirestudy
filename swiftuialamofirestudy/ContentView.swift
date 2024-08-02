//
//  ContentView.swift
//  swiftuialamofirestudy
//
//  Created by kenan on 2.08.2024.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            Text("Open terminal").onAppear{
                let udao = UserDAO()
                udao.searchUser(user_name: "Yeni")
                udao.getAllUsers()
            }
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
