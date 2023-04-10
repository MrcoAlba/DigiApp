//
//  CustomTabBar.swift
//  DigiApp
//
//  Created by Mrco on 10/04/23.
//

import SwiftUI

enum Tab : String, CaseIterable {
    case home1 = "house"
    case home2 = "house.lodge"
    case search = "magnifyingglass"
    case favourite = "heart.circle"
}

struct CustomTabBar: View {
    
    @Binding var selectedTab : Tab
    private var fillImage : String {
        selectedTab.rawValue + ".fill"
    }
    
    var body: some View {
        VStack {
            Spacer()
            HStack {
                ForEach (Tab.allCases, id: \.rawValue) { tab in
                    Spacer()
                    Image (systemName: selectedTab == tab ? fillImage : tab.rawValue)
                        .onAppear{
                            print(fillImage)
                        }
                        .scaleEffect(selectedTab == tab ? 1.25 : 1.0)
                        .foregroundColor(selectedTab == tab ? .red : .gray)
                        .font(.system(size: 22))
                        .onTapGesture {
                            withAnimation(.easeIn(duration: 0.1)) {
                                selectedTab = tab
                                print(tab.rawValue + " --- " + selectedTab.rawValue)

                            }
                        }
                    Spacer()
                }
            }
            .frame(width: nil, height: 60)
            .background(.thinMaterial)
            .cornerRadius(10)
            .padding()
        }
        .navigationBarBackButtonHidden(true)
    }
}

struct CustomTabBar_Previews: PreviewProvider {
    static var previews: some View {
        CustomTabBar(selectedTab: .constant(.home1))
    }
}
