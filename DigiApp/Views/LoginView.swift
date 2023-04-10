//
//  ContentView.swift
//  DigiApp
//
//  Created by Mrco on 7/04/23.
//

import SwiftUI

struct LoginView: View {
    
    @State var username : String
    @State var password : String
    @State var showPassword : Bool
    
    @State var selectedTab : Tab = .home1
    
    @State private var active: Bool = false
    
    var body: some View {
        NavigationStack {
            VStack {
                Spacer() // ----------------------------------------------------
                Text("WIKIMON")
                    .font(.title)
                    .fontWeight(.bold)
                Image("dinosaurio")
                    .resizable()
                    .frame(width: 200.0, height: 200.0)
                Spacer() // ----------------------------------------------------
                
                VStack {
                    HStack {
                        
                        Image(systemName: "person")
                            .foregroundColor(.primary)
                        
                        TextField("Username",text: $username)
                        
                    }
                    .padding()
                    .background(
                            Capsule()
                                .fill(Color.secondary)
                                .opacity(0.5)
                        )
                    HStack {
                        
                        Image(systemName: "lock")
                            .foregroundColor(.primary)
                        
                        if showPassword {
                            TextField("Password",text: $password)
                        } else {
                            SecureField("Password",text: $password)
                        }
                        
                        Button(action: { self.showPassword.toggle()}) {
                            Image(systemName: "eye")
                                .foregroundColor(.primary)
                        }
                        
                    }   .padding()
                        .background(
                                Capsule()
                                    .fill(Color.secondary)
                                    .opacity(0.5)
                            )
                }   .padding()
                
                
                
                
                
                
                
                NavigationLink(destination: {
                    CustomTabBar(selectedTab: $selectedTab)
                }, label: {
                    Text("Login")
                        .foregroundColor(.white)
                        .font(.system(size: 18))
                        .frame(width: 215, height: 44, alignment: .center)
                })
                .background(.secondary)
                .cornerRadius(4)
                
                                
                
                
                Spacer() // ----------------------------------------------------
                
            }
            .padding()
            .background(
                Image("digimonWallpaper")
                    .resizable()
                    .scaledToFill()
                    .ignoresSafeArea()
                    .blur(radius: 10)
                    .opacity(0.5)
                
            )
        }
        
    }
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView(username: "", password: "", showPassword: false)
            .previewDevice(PreviewDevice(rawValue: "iPhone 14"))
            .previewDisplayName("iPhone 14")
    }
}

