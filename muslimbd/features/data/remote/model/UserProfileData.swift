//
//  UserProfileData.swift
//  muslimbd
//
//  Created by Al Faruk on 31/12/24.
//

import Foundation

struct UserProfileData : Codable {
    internal init(birthDate: String? = nil, gender: String? = nil, imageUrl: String? = nil, mobileNo: String? = nil, userFullName: String? = nil) {
        self.birthDate = birthDate
        self.gender = gender
        self.imageUrl = imageUrl
        self.mobileNo = mobileNo
        self.userFullName = userFullName
    }
    
    let birthDate: String?
    let gender: String?
    let imageUrl: String?
    let mobileNo: String?
    let userFullName: String?
}
