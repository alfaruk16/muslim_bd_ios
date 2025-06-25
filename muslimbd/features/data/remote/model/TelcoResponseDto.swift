//
//  TelcoResponseDto.swift
//  muslimbd
//
//  Created by Al Faruk on 31/12/24.
//

import Foundation

struct TelcoResponseDto : Codable {
    internal init(response: String? = nil, errorCode: String? = nil, errorMessage: String? = nil) {
        self.response = response
        self.errorCode = errorCode
        self.errorMessage = errorMessage
    }
    
    let response: String?
    let errorCode: String?
    let errorMessage: String?
}
