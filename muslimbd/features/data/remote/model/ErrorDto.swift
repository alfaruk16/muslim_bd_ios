//
//  ErrorDto.swift
//  muslimbd
//
//  Created by Al Faruk on 31/12/24.
//

import Foundation

struct ErrorDto : Codable {
    internal init(message: String? = nil) {
        self.message = message
    }
    
    let message: String?
}
