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
            ToolbarItem(placement: toolbarPlacement) {
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

    private var toolbarPlacement: ToolbarItemPlacement {
        #if os(iOS) || os(visionOS) || os(tvOS)
        return .topBarTrailing
        #elseif os(macOS) || os(watchOS)
        return .automatic
        #else
        return .automatic
        #endif
    }
}

#Preview {
    NavigationStack {
        DashboardView()
            .navigationTitle("Dashboard")
    }
}
