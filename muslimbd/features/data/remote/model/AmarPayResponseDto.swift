//
//  AmarPayResponseDto.swift
//  muslimbd
//
//  Created by Al Faruk on 31/12/24.
//

import Foundation

struct AmarPayResponseDto : Codable {
    internal init(errorCode: String? = nil, errorMessage: String? = nil, redirectURL: String? = nil, subscriptionRequestId: String? = nil, timeStamp: String? = nil) {
        self.errorCode = errorCode
        self.errorMessage = errorMessage
        self.redirectURL = redirectURL
        self.subscriptionRequestId = subscriptionRequestId
        self.timeStamp = timeStamp
    }
    
    let errorCode: String?
    let errorMessage: String?
    let redirectURL: String?
    let subscriptionRequestId: String?
    let timeStamp: String?
}
