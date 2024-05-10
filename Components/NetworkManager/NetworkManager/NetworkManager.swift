//
//  NetworkManager.swift
//  NetworkManager
//
//  Created by Azizbek Musurmonov   on 02/04/24.
//

import Foundation
import Combine

final public class NetworkService {
    
    public static let shared = NetworkService()
    
    public func request<Model: Decodable>(
        url urlString: String,
        decode model: Model.Type,
        query: [String] = [],
        method: HttpMethod = .get,
        parameters: [String: Any] = [:]
    ) async throws -> Model {
        guard let url = URL(string: urlString) else { throw NetworkError.incorrectURL }
        
        var request = URLRequest(url: url)
        request.httpMethod = method.rawValue.uppercased()
        request.allHTTPHeaderFields = ["Accept-Language": "uz", "Accept-Device": "web"]
        
        if !parameters.isEmpty, let httpBody = try? JSONSerialization.data(withJSONObject: parameters, options: []) {
            
            request.httpBody = httpBody
        }
        
        
        
        let (data, response) = try await URLSession.shared.data(for: request)
        
        guard let response = response as? HTTPURLResponse, response.statusCode >= 200, response.statusCode < 300 else {
            
            let statusCode = (response as? HTTPURLResponse)?.statusCode ?? .zero
            
            print("⚠️⚠️⚠️⚠️⚠️⚠️⚠️⚠️⚠️⚠️⚠️ FAIL", urlString, statusCode)
            
            throw NetworkError.incorrectStatusCode(statusCode)
        }
        
        let model: Model
        
        do {
             model = try JSONDecoder().decode(Model.self, from: data)
        } catch {
            print("⚠️⚠️⚠️⚠️⚠️⚠️⚠️⚠️⚠️⚠️⚠️", "DecodeError \n", error)
            throw NetworkError.couldnotDecodeModel(error)
        }
        
        print("✅✅✅✅✅✅✅✅", urlString)
        return model
    }
}
