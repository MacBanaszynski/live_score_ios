//
//  SplashView.swift
//  LiveScore
//
//  Created by Maciej Banaszyński on 12/11/2025.
//
import SwiftUI

struct SplashView: View {
    @StateObject private var viewModel = SplashViewModel()
    var onFinish: (() -> Void)?

    var body: some View {
        ZStack {
            Color(.systemBackground).ignoresSafeArea()
            VStack {
                Image(systemName: "sportscourt.fill")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 96, height: 96)
                    .foregroundStyle(.tint)
                Text("LiveScore")
                    .font(.largeTitle)
                    .bold()
                    .padding()
            }
        }
        .task {
            await viewModel.start()
        }
        .onChange(of: viewModel.didFinish) { _, finished in
            if finished {
                onFinish?()
            }
        }
    }
}

extension SplashView {
    func onFinish(_ action: @escaping () -> Void) -> Self {
        var copy = self
        copy.onFinish = action
        return copy
    }
}

#Preview {
    SplashView()
}
