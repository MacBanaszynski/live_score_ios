//
//  DIContainer.swift
//  LiveScore
//
//  Created by Maciej Banaszyński on 12/11/2025.
//

import Foundation
import Combine

final class DIContainer: ObservableObject {
    let environment: EnvironmentProtocol
    let apiClient: ApiClientProtocol

    init(environment: EnvironmentProtocol? = nil) {
        let env = environment ?? AppEnvironment()
        self.environment = env
        self.apiClient = ApiClient(environment: env)
    }
}
