//
//  ApiError.swift
//  LiveScore
//
//  Created by Maciej Banaszyński on 12/11/2025.
//

import Foundation

enum ApiError: Error, LocalizedError, Sendable {
    case invalidURL
    case serverError(code: Int)
    case decodingError
    case unknown(Error)

    var errorDescription: String? {
        switch self {
        case .invalidURL: return "Invalid URL."
        case .serverError(let code): return "Server error (code: \(code))."
        case .decodingError: return "Failed to decode response."
        case .unknown(let error): return error.localizedDescription
        }
    }
}

