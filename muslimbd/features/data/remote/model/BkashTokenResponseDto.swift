//
//  BkashTokenResponseDto.swift
//  muslimbd
//
//  Created by Al Faruk on 31/12/24.
//

import Foundation

struct BkashTokenResponseDto : Codable {
    internal init(accessToken: String? = nil, expiresIn: Int? = nil, tokenType: String? = nil) {
        self.accessToken = accessToken
        self.expiresIn = expiresIn
        self.tokenType = tokenType
    }
    
    let accessToken: String?
    let expiresIn: Int?
    let tokenType: String?
}
