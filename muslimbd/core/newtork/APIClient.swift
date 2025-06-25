//
//  APIClient.swift
//  muslimbd
//
//  Created by Al Faruk on 29/12/24.
//


import Foundation
import Combine

protocol APIClient {
    func request<T: Decodable>(_ urlRequest: URLRequest) -> AnyPublisher<T, BaseError>
}
