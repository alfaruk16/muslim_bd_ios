//
//  LoginDto.swift
//  muslimbd
//
//  Created by Al Faruk on 31/12/24.
//

import Foundation

struct LoginDto : Codable {
    internal init(data: LoginDtoData? = nil, message: String? = nil, status: String? = nil) {
        self.data = data
        self.message = message
        self.status = status
    }
    
    let data: LoginDtoData?
    let message: String?
    let status: String?
}
