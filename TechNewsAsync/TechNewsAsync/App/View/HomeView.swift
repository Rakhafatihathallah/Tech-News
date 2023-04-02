//
//  HomeView.swift
//  TechNewsAsync
//
//  Created by Rakha Fatih Athallah on 07/11/22.
//

import SwiftUI

struct HomeView: View {
    var body: some View {
        TabView {
            ContentView()
                .embedNavigation()
                .tabItem {
                    Asset.home
                }.tag(0)
            ProfileView()
                .embedNavigation()
                .tabItem {
                    Asset.profile
                }.tag(1)
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
