//
//  SignUp.swift
//  muslimbd
//
//  Created by Al Faruk on 31/12/24.
//

struct SignUp: Codable {
    let AppDeviceId: String
    let City: String?
    let Country: String?
    let CountryCode: String?
    let DeviceInfo: String?
    let FcmDeviceId: String?
    let Latitude: Double
    let LoginCode: String?
    let Longitude: Double
    let Password: String
    let RegisterWith: String?
    let TelcoProvider: String
    let UserName: String
    var AppTypes: String = "mb"
}
