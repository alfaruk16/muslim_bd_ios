//
//  RestClient.swift
//  muslimbd
//
//  Created by Al Faruk on 29/12/24.
//

import Foundation
import Combine

protocol RestClient {
    func get<T: Decodable, E: Endpoint>(_ endpoint: E) -> AnyPublisher<T, Error>
    
    func post<T: Decodable, S: Encodable, E: Endpoint>(_ endpoint: E, using body: S) -> AnyPublisher<T, Error>
    
    func postWithQuery<T: Decodable, E: Endpoint>(_ endpoint: E, queries: [String : String]) -> AnyPublisher<T, Error>
    
    func postMultipart<T: Decodable, S: Encodable, E: Endpoint>(_ endpoint: E, using body: S) -> AnyPublisher<T, Error>
    
    func delete<T: Decodable, E: Endpoint>(_ endpoint: E) -> AnyPublisher<T, Error>
    
    func postWithToken<T: Decodable, S: Encodable, E: Endpoint>(_ endpoint: E, usign body: S, token: String) -> AnyPublisher<T, Error>
}

class RestClientImpl: RestClient {
    private let session: URLSession
    
    init(sessionConfig: URLSessionConfiguration? = nil) {
        self.session = URLSession(configuration: sessionConfig ?? URLSessionConfiguration.default)
    }
    
    func get<T, E>(_ endpoint: E) -> AnyPublisher<T, Error> where T: Decodable, E: Endpoint {
        startRequest(for: endpoint, method: "GET", jsonBody: nil as String?)
            .tryMap { try $0.parseJson() }
            .eraseToAnyPublisher()
    }
    
    func post<T, S, E>(_ endpoint: E, using body: S)
    -> AnyPublisher<T, Error> where T: Decodable, S: Encodable, E: Endpoint
    {
        startRequest(for: endpoint, method: "POST", jsonBody: body)
            .tryMap { try $0.parseJson() }
            .catch{
                error -> AnyPublisher<T, Error> in
                switch error{
                case RestClientErrors.noDataReceived : return Just(() as! T).setFailureType(to: Error.self).eraseToAnyPublisher()
                default: return Fail<T, Error>(error: error).eraseToAnyPublisher()
                }
            }
            .eraseToAnyPublisher()
    }
    
    func postWithQuery<T, E>(_ endpoint: E, queries: [String : String]) -> AnyPublisher<T, any Error> where T : Decodable, E : Endpoint {
        startRequest(for: endpoint, method: "POST", jsonBody: Empty())
            .tryMap { try $0.parseJson() }
            .catch{
                error -> AnyPublisher<T, Error> in
                switch error{
                case RestClientErrors.noDataReceived : return Just(() as! T).setFailureType(to: Error.self).eraseToAnyPublisher()
                default: return Fail<T, Error>(error: error).eraseToAnyPublisher()
                }
            }
            .eraseToAnyPublisher()
    }
    
    func postMultipart<T, S, E>(_ endpoint: E, using body: S) -> AnyPublisher<T, any Error> where T : Decodable, S : Encodable, E : Endpoint {
        startRequest(for: endpoint, method: "POST", jsonBody: body, isMultipart: true)
            .tryMap { try $0.parseJson() }
            .catch{
                error -> AnyPublisher<T, Error> in
                switch error{
                case RestClientErrors.noDataReceived : return Just(() as! T).setFailureType(to: Error.self).eraseToAnyPublisher()
                default: return Fail<T, Error>(error: error).eraseToAnyPublisher()
                }
            }
            .eraseToAnyPublisher()
    }
    
    func delete<T, E>(_ endpoint: E) -> AnyPublisher<T, any Error> where T : Decodable, E : Endpoint {
        startRequest(for: endpoint, method: "DELETE", jsonBody: Empty())
            .tryMap { try $0.parseJson() }
            .catch{
                error -> AnyPublisher<T, Error> in
                switch error{
                case RestClientErrors.noDataReceived : return Just(() as! T).setFailureType(to: Error.self).eraseToAnyPublisher()
                default: return Fail<T, Error>(error: error).eraseToAnyPublisher()
                }
            }
            .eraseToAnyPublisher()
    }
    
    func postWithToken<T, S, E>(_ endpoint: E, usign body: S, token: String) -> AnyPublisher<T, any Error> where T : Decodable, S : Encodable, E : Endpoint {
        startRequest(for: endpoint, method: "POST", jsonBody: body, token: token)
            .tryMap { try $0.parseJson() }
            .catch{
                error -> AnyPublisher<T, Error> in
                switch error{
                case RestClientErrors.noDataReceived : return Just(() as! T).setFailureType(to: Error.self).eraseToAnyPublisher()
                default: return Fail<T, Error>(error: error).eraseToAnyPublisher()
                }
            }
            .eraseToAnyPublisher()
    }
    
    
    private func startRequest<T: Encodable, S: Endpoint>(for endpoint: S, method: String, jsonBody: T? = nil, queries: [String : String] = [:], isMultipart: Bool = false, token: String? = nil)
    -> AnyPublisher<InterimRestResponse, Error> {
        var request: URLRequest
        
        do {
            request = try buildRequest(endpoint: endpoint, method: method, jsonBody: jsonBody, queries: queries, isMultipart: isMultipart, token: token)
        } catch {
            print("Failed to create request: \(String(describing: error))")
            return Fail(error: error).eraseToAnyPublisher()
        }
        
        print("Starting \(method) request for \(String(describing: request))")
        
        return session.dataTaskPublisher(for: request)
            .mapError { (error: Error) -> Error in
                print("Request failed: \(String(describing: error))")
                return RestClientErrors.requestFailed(error: error)
            }
            .tryMap { (data: Data, response: URLResponse) in
                let response = response as! HTTPURLResponse
                print("Got response with status code \(response.statusCode) and \(data.count) bytes of data")
                
                if response.statusCode == 400 {
                    throw RestClientErrors.requestFailed(code: response.statusCode)
                }
                return InterimRestResponse(data: data, response: response)
            }.eraseToAnyPublisher()
    }
    
    private func buildRequest<T: Encodable, S: Endpoint>(endpoint: S, method: String, jsonBody: T?, queries : [String : String] = [:], isMultipart: Bool = false, token: String? = nil) throws -> URLRequest {
        var request = URLRequest(url: endpoint.url, timeoutInterval: 10)
        request.httpMethod = method
        request.allHTTPHeaderFields = ["Content-Type": "application/json",
                                       "Authorization": token ?? MuslimbdApp.token]
        for item in queries {
            request.addValue(item.key, forHTTPHeaderField: item.value)
        }
        if(isMultipart){
            request.setValue("multipart/form-data", forHTTPHeaderField: "payload")
        }
        
        if let body = jsonBody {
            do {
                request.httpBody = try JSONEncoder().encode(body)
            } catch {
                throw RestClientErrors.jsonDecode(error: error)
            }
        }
        return request
    }
    
    struct InterimRestResponse {
        let data: Data
        let response: HTTPURLResponse
        
        func parseJson<T: Decodable>() throws -> T {
            if data.isEmpty {
                throw RestClientErrors.noDataReceived
            }
            
            do {
                let result = try JSONDecoder().decode(T.self, from: data)
                //print("JSON Result: \(result)", String(describing: result))
                return result
            } catch {
                print("Failed to decode JSON: \(error)", String(describing: error))
                throw RestClientErrors.jsonDecode(error: error)
            }
        }
    }
    
}
