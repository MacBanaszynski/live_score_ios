//
//  DashboardView.swift
//  LiveScore
//
//  Created by Maciej Banaszyński on 12/11/2025.
//
import SwiftUI

struct DashboardView: View {
    
    var body: some View {
        VStack(spacing: 12) {
            DaySelectorSliderView()

            // Placeholder for the rest of the dashboard segments
            Spacer()
            Text("Dashboard here")
                .foregroundStyle(.secondary)
            Spacer()
        }
        .toolbar {
            ToolbarItem(placement: .topBarTrailing) {
                NavigationLink {
                    // TODO: Replace with your Search screen when it exists
                    Text("Search screen placeholder")
                        .navigationTitle("Search")
                } label: {
                    Image(systemName: "magnifyingglass")
                }
                .accessibilityLabel("Search")
            }
        }
    }

   
}

#Preview {
    NavigationStack {
        DashboardView()
            .navigationTitle("Dashboard")
    }
}
