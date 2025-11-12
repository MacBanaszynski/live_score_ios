//
//  LiveScoreApp.swift
//  LiveScore
//
//  Created by Maciej Banaszyński on 12/11/2025.
//

import SwiftUI

@main
struct LiveScoreApp: App {
    @StateObject private var container = DIContainer()

    var body: some Scene {
        WindowGroup {
            AppView()
                .environmentObject(container)
        }
    }
}
