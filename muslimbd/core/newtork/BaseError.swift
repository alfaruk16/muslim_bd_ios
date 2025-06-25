//
//  BaseError.swift
//  muslimbd
//
//  Created by Al Faruk on 29/12/24.
//

import Foundation

enum BaseError : Error {
    case parse(description: String)
    case api(description: String)
}
