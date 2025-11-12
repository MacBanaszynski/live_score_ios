//
//  HomeView.swift
//  LiveScore
//
//  Created by Maciej Banaszyński on 12/11/2025.
//

import SwiftUI

struct HomeView: View {
    @State private var selectedTab = 0

    var body: some View {
        TabView(selection: $selectedTab) {
            NavigationStack {
                DashboardView()
                    .navigationTitle("Dashboard")
            }
            .tabItem { Label("Matches", systemImage: "sportscourt") }
            .tag(0)

            NavigationStack {
                NewsView()
                    .navigationTitle("News")
            }
            .tabItem { Label("News", systemImage: "newspaper") }
            .tag(1)

            NavigationStack {
                AccountView()
                    .navigationTitle("Account")
            }
            .tabItem { Label("Account", systemImage: "person.circle") }
            .tag(2)
        }
    }
}

#Preview {
    HomeView()
}
