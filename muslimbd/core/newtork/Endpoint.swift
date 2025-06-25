//
//  Endpoint.swift
//  muslimbd
//
//  Created by Al Faruk on 29/12/24.
//

import Foundation

protocol Endpoint {
    var url: URL { get }
    var path: String { get }
}
