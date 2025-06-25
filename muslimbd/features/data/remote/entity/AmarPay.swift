//
//  AmarPay.swift
//  muslimbd
//
//  Created by Al Faruk on 31/12/24.
//

struct AmarPay: Encodable {
    let MSISDN: String
    let channel: String = "APP"
    let clientCallBack: String = ""
    let cus_email: String = ""
    let cus_name: String = ""
    let puser: String = ""
    let serviceid: String
}
