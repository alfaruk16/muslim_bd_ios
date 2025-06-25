//
//  SmsRepoApiImpl.swift
//  muslimbd
//
//  Created by Al Faruk on 6/1/25.
//

import Foundation
import Combine
import Resolver

class SmsRepoApiImpl: SmsApiRepo {
    @Injected private var client: RestClient
    
    func requestOtp(otp: Otp) -> AnyPublisher<OtpDto, any Error> {
        client.post(APIEndpoint.requestOtp, using: otp)
    }
    
    func checkOtp(checkOtp: CheckOtp) -> AnyPublisher<OtpDto, any Error> {
        client.post(APIEndpoint.checkOtp, using: checkOtp)
    }
    
    func smsRegistration(body: SMSRegistration) -> AnyPublisher<SMSRegistrationResponseDto, any Error> {
        client.post(APIEndpoint.smsRegistration, using: body)
    }
    
}
