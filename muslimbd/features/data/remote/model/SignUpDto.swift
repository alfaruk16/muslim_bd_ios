//
//  SignUpDto.swift
//  muslimbd
//
//  Created by Al Faruk on 31/12/24.
//

import Foundation

struct SignUpDto : Codable {
    internal init(data: SignUpDtoData? = nil, message: String? = nil, status: String? = nil) {
        self.data = data
        self.message = message
        self.status = status
    }
    
    let data: SignUpDtoData?
    let message: String?
    let status: String?
}
