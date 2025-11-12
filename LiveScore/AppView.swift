//
//  AppView.swift
//  LiveScore
//
//  Created by Maciej Banaszyński on 12/11/2025.
//

import SwiftUI

struct AppView: View {
    @EnvironmentObject private var container: DIContainer
    @State private var showSplash = true

    var body: some View {
        Group {
            if showSplash {
                SplashView()
                    .onFinish {
                        withAnimation(.easeOut) {
                            showSplash = false
                        }
                    }
                    .transition(.opacity)
            } else {
                HomeView()
                    .transition(.opacity)
            }
        }
    }
}

#Preview {
    AppView()
        .environmentObject(DIContainer())
}
