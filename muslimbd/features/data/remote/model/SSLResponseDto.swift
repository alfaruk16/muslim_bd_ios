//
//  SSLResponseDto.swift
//  muslimbd
//
//  Created by Al Faruk on 31/12/24.
//

import Foundation

struct SSLResponseDto : Codable {
    internal init(gatewayPageURL: String? = nil, errorCode: String? = nil, errorMessage: String? = nil, status: String? = nil, subscriptionId: String? = nil) {
        self.gatewayPageURL = gatewayPageURL
        self.errorCode = errorCode
        self.errorMessage = errorMessage
        self.status = status
        self.subscriptionId = subscriptionId
    }
    
    let gatewayPageURL: String?
    let errorCode: String?
    let errorMessage: String?
    let status: String?
    let subscriptionId: String?
}
