//
//  OtpDto.swift
//  muslimbd
//
//  Created by Al Faruk on 31/12/24.
//

import Foundation

struct OtpDto : Codable {
    internal init(response: String? = nil) {
        self.response = response
    }
    
    let response: String?
}
