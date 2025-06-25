//
//  RestClientError.swift
//  muslimbd
//
//  Created by Al Faruk on 29/12/24.
//

import Foundation

enum RestClientErrors: Error {
    case requestFailed(error: Error)
    case requestFailed(code: Int)
    case noDataReceived
    case jsonDecode(error: Error)
}
