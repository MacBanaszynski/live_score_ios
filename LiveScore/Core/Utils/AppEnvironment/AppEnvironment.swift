//
//  AppEnvironment.swift
//  LiveScore
//
//  Created by Maciej Banaszyński on 12/11/2025.
//

import Foundation
import Alamofire

// Keys expected in Info.plist
// - API_BASE_URL (String)
// - API_KEY (String, optional)
// - API_DEFAULT_HEADER_NAME (String, optional) e.g. "X-Api-Key"
// - API_DEFAULT_HEADER_VALUE (String, optional) used if API_KEY isn't used directly
final class AppEnvironment: EnvironmentProtocol {
    let baseURL: URL
    let apiKey: String?
    let defaultHeaders: HTTPHeaders
    let additionalQueryItems: [URLQueryItem]

    init(info: [String: Any] = Bundle.main.infoDictionary ?? [:]) {
        // Base URL
        guard let baseURLString = info["API_BASE_URL"] as? String,
              let baseURL = URL(string: baseURLString) else {
            fatalError("Missing or invalid API_BASE_URL in Info.plist")
        }
        self.baseURL = baseURL

        // API key (optional)
        self.apiKey = info["API_KEY"] as? String

        // Optional default header name/value
        let defaultHeaderName = info["API_DEFAULT_HEADER_NAME"] as? String
        let defaultHeaderValue = info["API_DEFAULT_HEADER_VALUE"] as? String

        var headers = HTTPHeaders()

        // If you have an API key and a header name, inject it.
        if let key = apiKey, let headerName = defaultHeaderName {
            headers.add(name: headerName, value: key)
        } else if let headerName = defaultHeaderName, let value = defaultHeaderValue {
            headers.add(name: headerName, value: value)
        }

        self.defaultHeaders = headers

        // Optional: global query items (e.g., api_key as query)
        if let key = apiKey, info["API_KEY_AS_QUERY"] as? Bool == true {
            self.additionalQueryItems = [URLQueryItem(name: "api_key", value: key)]
        } else {
            self.additionalQueryItems = []
        }
    }

    func headers(for path: String) -> HTTPHeaders {
        // Customize per-path headers here if needed.
        defaultHeaders
    }
}

