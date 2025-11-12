//
//  SplashViewModel.swift
//  LiveScore
//
//  Created by Maciej Banaszyński on 12/11/2025.
//
import Combine

@MainActor
final class SplashViewModel: ObservableObject {
    @Published var didFinish = false

    func start() async {
        try? await Task.sleep(nanoseconds: 1_000_000_000)
        didFinish = true
    }
}
