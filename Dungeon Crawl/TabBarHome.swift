//
//  Home.swift
//  Dungeon Crawl
//
//  Created by Monica Galan de la Llana on 18/11/23.
//

import SwiftUI

struct TabBarHome: View {
    @State var selectedTab = 0
    
    init() {
        let appearance = UITabBarAppearance()
        appearance.configureWithTransparentBackground()
    }
    
    var body: some View {
        ZStack(alignment: .bottom){
                TabView(selection: $selectedTab) {
                    CampaignListView()
                        .tag(0)
                    NpcListView()
                        .tag(1)
                    MonsterListView()
                        .tag(2)
                }
            HStack(spacing: 0){
                    ForEach((TabBarItems.allCases), id: \.self){ item in
                        Button{
                            selectedTab = item.rawValue                    } label: {
                                CustomTabItem(imageName: item.iconName, title: item.title, isActive: (selectedTab == item.rawValue))
                            }
                    }
                }
                .frame(height: 60)
        }
        .onAppear {
            // correct the transparency bug for Tab bars
            let tabBarAppearance = UITabBarAppearance()
            tabBarAppearance.configureWithOpaqueBackground()
            tabBarAppearance.backgroundColor = .black
            
            UITabBar.appearance().standardAppearance = tabBarAppearance
            UITabBar.appearance().scrollEdgeAppearance = tabBarAppearance
        }
    }
}

extension TabBarHome{
    func CustomTabItem(imageName: String, title: String, isActive: Bool) -> some View {
        VStack(spacing: 5){
            Image(imageName)
                .resizable()
                .scaledToFit()
                .frame(maxHeight: isActive ? 28 : 18)
            if isActive {
                withAnimation {
                    Text(title)
                        .font(.caption)
                        .transition(.move(edge: .bottom))
                }
            }
            
        }
        .foregroundColor(isActive ? Color.accentDungeon : .gray)
        .padding(10)
        .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/)
        .background(.black)
        .cornerRadius(30.0)
        .offset(y: isActive ? 0 : 10)
    }
}

#Preview {
    TabBarHome()
}
