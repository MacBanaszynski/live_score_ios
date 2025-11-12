//
//  ApiClientProtocol.swift
//  LiveScore
//
//  Created by Maciej Banaszyński on 12/11/2025.
//
import Foundation
import Alamofire

protocol ApiClientProtocol {
    func request<T: Decodable & Sendable>(_ endpoint: Endpoint, as type: T.Type) async throws -> T
}
