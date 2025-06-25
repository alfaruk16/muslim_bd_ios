//
//  UpdateProfile.swift
//  muslimbd
//
//  Created by Al Faruk on 31/12/24.
//

struct UpdateProfile: Encodable {
    let userFullName: String
    let mobileNo: String
    let imageUrl: String = "0"
    let birthDate: String
    let gender: String
}
