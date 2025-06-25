//
//  LoginDtoData.swift
//  muslimbd
//
//  Created by Al Faruk on 31/12/24.
//

import Foundation

struct LoginDtoData : Codable {
    internal init(gender: String? = nil, rwith: [String]? = nil, token: String? = nil, userCode: String? = nil, userFullName: String? = nil, userPic: String? = nil) {
        self.gender = gender
        self.rwith = rwith
        self.token = token
        self.userCode = userCode
        self.userFullName = userFullName
        self.userPic = userPic
    }
    
    let gender: String?
    let rwith: [String]?
    let token: String?
    let userCode: String?
    let userFullName: String?
    let userPic: String?
}
