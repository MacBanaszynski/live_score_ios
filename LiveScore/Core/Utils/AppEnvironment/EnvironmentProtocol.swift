//
//  EnvironmentProtocol.swift
//  LiveScore
//
//  Created by Maciej Banaszyński on 12/11/2025.
//

import Foundation
import Alamofire

public protocol EnvironmentProtocol: Sendable {
    var baseURL: URL { get }
    var apiKey: String? { get }
    var defaultHeaders: HTTPHeaders { get }
    var additionalQueryItems: [URLQueryItem] { get }

    func headers(for path: String) -> HTTPHeaders
}

public extension EnvironmentProtocol {
    func headers(for path: String) -> HTTPHeaders { defaultHeaders }
    var additionalQueryItems: [URLQueryItem] { [] }
}

