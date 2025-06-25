//
//  GPDto.swift
//  muslimbd
//
//  Created by Al Faruk on 31/12/24.
//

import Foundation

struct GPDto : Codable {
    internal init(errorCode: String? = nil, errorMessage: String? = nil, response: String? = nil) {
        self.errorCode = errorCode
        self.errorMessage = errorMessage
        self.response = response
    }
    
    let errorCode: String?
    let errorMessage: String?
    let response: String?
}
