//
//  Endpoint.swift
//  LiveScore
//
//  Created by Maciej Banaszyński on 12/11/2025.
//

import Foundation
import Alamofire

struct Endpoint: Sendable {
    let path: String
    let method: HTTPMethod
    let parameters: Parameters?
    let encoding: ParameterEncoding
    let headers: HTTPHeaders?

    init(path: String,
         method: HTTPMethod = .get,
         parameters: Parameters? = nil,
         encoding: ParameterEncoding = URLEncoding.default,
         headers: HTTPHeaders? = nil) {
        self.path = path
        self.method = method
        self.parameters = parameters
        self.encoding = encoding
        self.headers = headers
    }
}

extension Endpoint {
    static var dashboard: Endpoint {
        Endpoint(path: "/dashboard", method: .get)
    }

    static var news: Endpoint {
        Endpoint(path: "/news", method: .get)
    }

    static var account: Endpoint {
        Endpoint(path: "/account", method: .get)
    }
}

