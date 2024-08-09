//
//  NetworkManager.swift
//  NetworkManager
//
//  Created by Ismatillokhon   on 02/04/24.
//

import Foundation
import Combine
import Core
import UIKit

final public class NetworkService {
    
    private init() { }
    
    public static let shared = NetworkService()
    
    public func request<T: Decodable>(
        url: String,
        decode: T.Type,
        method: HTTPMethod,
        queryParameters: [String: String]? = nil,
        body: [String: Any]? = nil,
        header: [String: String] = [:]
    ) async throws -> T {
        guard var components = URLComponents(string: url) else {
            throw NetworkError.invalidURL
        }
        let newLine = "\n"
        var string = "REQUEST------------------ \(url)"
        
        string += newLine
        
        // Add query parameters to the URL if provided
        if let queryParameters = queryParameters {
            components.queryItems = queryParameters.map { URLQueryItem(name: $0.key, value: $0.value) }
            string += "queryParameters: \(queryParameters)"
            string += newLine
        }
        
        guard let finalURL = components.url else {
            throw NetworkError.invalidURL
        }
        
        var request = URLRequest(url: finalURL)
        request.httpMethod = method.rawValue
    
        // set header
        print("-------------------------HEADER---------------------------------")
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        print("Content-Type", "application/json","\n")
        request.setValue("iOS", forHTTPHeaderField: "Accept-Device")
        if let language = DataStorage.storage.get(from: .language) as? String {
            request.setValue(language, forHTTPHeaderField: "Accept-Language")
            print("Accept-Language", language,"\n")
        }
        if let token = DataStorage.storage.get(from: .token) as? String {
            request.setValue("Bearer \(token)", forHTTPHeaderField: "Authorization")
            print("Authorization", "Bearer", "TOKEN", token,"\n")
        }
        if !header.isEmpty {
            header.forEach { (key, value) in
            request.setValue(key, forHTTPHeaderField: value)
            }
        }
        
        if let deviceId = await UIDevice.current.identifierForVendor?.uuidString {
            request.setValue(deviceId, forHTTPHeaderField: "Accept-DeviceId")
            print("DeviceId", deviceId)
        }
        
        // Add request body if provided
        if let body = body {
            request.httpBody = try? JSONSerialization.data(withJSONObject: body)
            
            string += "body: \(body)"
            string += newLine
        } else {
            print("BODY IS EMPTY", url)
        }
        
        do {
            let (data, response) = try await URLSession.shared.data(for: request)
            guard let safeResponse = response as? HTTPURLResponse,
                      safeResponse.statusCode >= 200,
                      safeResponse.statusCode < 300
            else {
                guard let response = (response as? HTTPURLResponse) else { throw NetworkError.requestFailed }
                
                print(string)
                throw NetworkError.incorrectStatusCode(response.statusCode)
            }
            string += "✅✅✅✅ SUCCESS"
            string += newLine
            
            string += "\( try JSONSerialization.jsonObject(with: data))"
            print(try JSONSerialization.jsonObject(with: data))
            let decoder = JSONDecoder()
            let decodedObject = try decoder.decode(T.self, from: data)
            print(string)
            return decodedObject
        } catch {
            print(string)
            print("in model, ", T.self, "🛑🛑🛑🛑🛑🛑🛑 DECODE ERROR", error)
            throw error
        }
    }
    
    public func getTransactionID(transaction: @escaping(TransactionModel) -> ()) {
        Task.detached {
            do {
                let success = try await self.request(
                    url: "https://lab.7saber.uz/api/client/card/store",
                    decode: TransactionModel.self,
                    method: .get
                )
                
                await MainActor.run {
                    transaction(success)
                }
            } catch {
                print("ERROR on getting Transaction", error.localizedDescription)
            }
        }
    }
}

public struct TransactionModel: Codable {
    public let paymentID, requesterID: Int
    public let transactionID, token, type: String
    public let amount: Int
    public let currency, status, language, createdDate: String
    public let paymentURL: String
    public let lastModifiedDate: String

    public enum CodingKeys: String, CodingKey {
        case paymentID = "paymentId"
        case requesterID = "requesterId"
        case transactionID = "transactionId"
        case token, type, amount, currency, status, language, createdDate
        case paymentURL = "paymentUrl"
        case lastModifiedDate
    }
}

extension Dictionary {
    public func percentEncoded() -> Data? {
        map { key, value in
            let escapedKey = "\(key)".addingPercentEncoding(withAllowedCharacters: .urlQueryValueAllowed) ?? ""
            let escapedValue = "\(value)".addingPercentEncoding(withAllowedCharacters: .urlQueryValueAllowed) ?? ""
            return escapedKey + "=" + escapedValue
        }
        .joined(separator: "&")
        .data(using: .utf8)
    }
}

extension CharacterSet {
    static let urlQueryValueAllowed: CharacterSet = {
        let generalDelimitersToEncode = ":#[]@" // does not include "?" or "/" due to RFC 3986 - Section 3.4
        let subDelimitersToEncode = "!$&'()*+,;="
        
        var allowed: CharacterSet = .urlQueryAllowed
        allowed.remove(charactersIn: "\(generalDelimitersToEncode)\(subDelimitersToEncode)")
        return allowed
    }()
}
