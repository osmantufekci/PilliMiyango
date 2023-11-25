//
//  HTTPClient.swift
//  Pilli Miyango
//
//  Created by Osman Tufekci on 14.11.2023.
//

import Foundation

//protocol HTTPClient {
//    func sendRequest<T: Decodable>(url: URL?, responseModel: T.Type) async -> Result<BaseResult<T>, RequestError>
//}

struct HTTPClient {
    func sendRequest<T: Decodable>(
        url: URL?,
        responseModel: T.Type
    ) async -> Result<T, RequestError> {
        
        guard let url = url else {
            print("❌ Invalid URL")
            return .failure(.invalidURL)
        }
        
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
       
        do {
            let (data, response) = try await URLSession.shared.data(for: request, delegate: nil)
            guard let httpResponse = response as? HTTPURLResponse else {
                return .failure(.noResponse)
            }
            switch httpResponse.statusCode {
            case 200...299:
                guard let decodedResponse = try? JSONDecoder().decode(T.self, from: data) else {
                    return .failure(.decode)
                }
                return .success(decodedResponse)
            case 401:
                return .failure(.unauthorized)
            default:
                return .failure(.unexpectedStatusCode)
            }
        } catch {
            return .failure(.unknown)
        }
    }
    
    func getMockData<T: Decodable>(from file: String, modelType: T.Type) -> T? {
        
        if let file = Bundle.main.path(forResource: file, ofType: "json") {
            let url = URL(fileURLWithPath: file)
            if let fileData = try? Data(contentsOf: url),
               let model = try? JSONDecoder().decode(T.self, from: fileData){
                return model
            }
            
        }
        
        return nil
        
    }
}


