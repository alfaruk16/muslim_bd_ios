//
//  Untitled.swift
//  muslimbd
//
//  Created by Al Faruk on 31/12/24.
//

import Foundation

struct NagadResponseDto : Codable {
    internal init(errorCode: String? = nil, errorMessage: String? = nil, paymentUrl: String? = nil) {
        self.errorCode = errorCode
        self.errorMessage = errorMessage
        self.paymentUrl = paymentUrl
    }
    
    let errorCode: String?
    let errorMessage: String?
    let paymentUrl: String?
}
