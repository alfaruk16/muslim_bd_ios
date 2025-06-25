//
//  BKashResponseDto.swift
//  muslimbd
//
//  Created by Al Faruk on 31/12/24.
//

import Foundation

struct BKashResponseDto : Codable {
    internal init(subscriptionRequestId: String? = nil, redirectURL: String? = nil, timeStamp: String? = nil, errorCode: String? = nil, errorMessage: String? = nil) {
        self.subscriptionRequestId = subscriptionRequestId
        self.redirectURL = redirectURL
        self.timeStamp = timeStamp
        self.errorCode = errorCode
        self.errorMessage = errorMessage
    }
    
    let subscriptionRequestId: String?
    let redirectURL: String?
    let timeStamp: String?
    let errorCode: String?
    let errorMessage: String?
}
