//
//  ApiClient.swift
//  LiveScore
//
//  Created by Maciej Banaszyński on 12/11/2025.
//
import Foundation
import Alamofire

final class ApiClient: ApiClientProtocol {
    private let environment: EnvironmentProtocol
    private let session: Session

    init(environment: EnvironmentProtocol,
         session: Session = .default) {
        self.environment = environment
        self.session = session
    }

    func request<T: Decodable & Sendable>(_ endpoint: Endpoint, as type: T.Type) async throws -> T {
        // Build full URL
        let url = environment.baseURL.appendingPathComponent(endpoint.path)

        // Merge default headers from environment with endpoint headers
        var headers = environment.headers(for: endpoint.path)
        if let endpointHeaders = endpoint.headers {
            for header in endpointHeaders {
                headers.update(name: header.name, value: header.value)
            }
        }

        // Optionally append environment global query items
        let finalURL: URL
        if !environment.additionalQueryItems.isEmpty,
           var components = URLComponents(url: url, resolvingAgainstBaseURL: false) {
            var items = components.queryItems ?? []
            items.append(contentsOf: environment.additionalQueryItems)
            components.queryItems = items
            guard let rebuiltURL = components.url else {
                throw ApiError.invalidURL
            }
            finalURL = rebuiltURL
        } else {
            finalURL = url
        }

        let response = await session.request(
            finalURL,
            method: endpoint.method,
            parameters: endpoint.parameters,
            encoding: endpoint.encoding,
            headers: headers
        )
        .validate()
        .serializingDecodable(T.self, automaticallyCancelling: true)
        .response

        switch response.result {
        case .success(let value):
            return value
        case .failure(let error):
            if let afError = error.asAFError, afError.isResponseValidationError {
                throw ApiError.serverError(code: response.response?.statusCode ?? 500)
            } else if error.asAFError?.isResponseSerializationError == true {
                throw ApiError.decodingError
            } else {
                throw ApiError.unknown(error)
            }
        }
    }
}

