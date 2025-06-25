//
//  MainScreen.swift
//  muslimbd
//
//  Created by Al Faruk on 29/12/24.
//

import SwiftUI

struct MainScreen: View {
    
    init() {
        let appeareance = UITabBarAppearance()
        appeareance.backgroundColor = UIColor(Color.white)
        
        // Use this appearance when scrolling behind the TabView:
        UITabBar.appearance().standardAppearance = appeareance
        // Use this appearance when scrolled all the way up:
        UITabBar.appearance().scrollEdgeAppearance = appeareance
        
        //UITabBar.appearance().backgroundColor = UIColor(Color.Primary)
        UITabBar.appearance().barTintColor = UIColor(Color.primary)
        UITabBar.appearance().unselectedItemTintColor = UIColor(Color.backgroundDark)
        //UITabBar.appearance().isTranslucent = false
        
    }
    
    var body: some View {
        TabView {
            HomeScreen().tabItem{
                Label("", image: .home)
            }
        }
    }
}

#Preview {
    MainScreen()
}
