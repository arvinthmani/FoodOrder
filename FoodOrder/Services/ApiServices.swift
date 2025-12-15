//
//  ApiServices.swift
//  FoodOrder
//
//  Created by Arvinth Manivasakan on 28/05/25.
//

import Foundation

enum ApiError: Error {
    case urlInvalidError
    case dataError
    case JsonDecoderError
    case JsonEncoderError
}

class ApiServices {
    let session: URLSession
    
    init(session: URLSession = .shared) {
        self.session = session
    }
    
    enum HttpMethod: String {
        case GET, POST, PUT, DELETE
    }
    
    func request<T: Decodable, U: Encodable>(
        urlStr: String,
        method: HttpMethod = .GET,
        headers: [String: String] = [:],
        body: U? = nil,
        decoder: JSONDecoder = JSONDecoder(),
        encoder: JSONEncoder = JSONEncoder()
    ) async throws -> T {
        guard let url = URL(string: urlStr) else { throw ApiError.urlInvalidError }
        var request = URLRequest(url: url)
        request.httpMethod = method.rawValue
        for (key, value) in headers { request.setValue(value, forHTTPHeaderField: key) }
        
        if let body = body {
            do {
                request.httpBody = try encoder.encode(body)
                request.setValue("application/json", forHTTPHeaderField: "Content-Type")
            } catch {
                throw ApiError.JsonEncoderError
            }
        }
        do {
            let (data, _) = try await session.data(for: request)
            do {
                return try decoder.decode(T.self, from: data)
            } catch {
                throw ApiError.JsonDecoderError
            }
        } catch {
            throw ApiError.dataError
        }
    }
}
