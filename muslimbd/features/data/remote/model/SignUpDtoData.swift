//
//  SignUpDtoData.swift
//  muslimbd
//
//  Created by Al Faruk on 31/12/24.
//

import Foundation

struct SignUpDtoData : Codable {
    internal init(rwith: [String]? = nil, token: String? = nil, userCode: String? = nil) {
        self.rwith = rwith
        self.token = token
        self.userCode = userCode
    }
    
    let rwith: [String]?
    let token: String?
    let userCode: String?
}
