//
//  SubStatusDtoItem.swift
//  muslimbd
//
//  Created by Al Faruk on 31/12/24.
//

import Foundation

struct SubStatusDtoItem : Codable {
    internal init(MSISDN: String? = nil, errorCode: String? = nil, errorMessage: String? = nil, lastupdate: String? = nil, regstatus: String? = nil, serviceid: String? = nil, servicename: String? = nil, chargeAmount: String? = nil, frequency: String? = nil) {
        self.MSISDN = MSISDN
        self.errorCode = errorCode
        self.errorMessage = errorMessage
        self.lastupdate = lastupdate
        self.regstatus = regstatus
        self.serviceid = serviceid
        self.servicename = servicename
        self.chargeAmount = chargeAmount
        self.frequency = frequency
    }
    
    let MSISDN: String?
    let errorCode: String?
    let errorMessage: String?
    let lastupdate: String?
    let regstatus: String?
    let serviceid: String?
    let servicename: String?
    let chargeAmount: String?
    let frequency: String?
}
