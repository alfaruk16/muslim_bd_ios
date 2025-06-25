//
//  RequestOtpUseCase.swift
//  muslimbd
//
//  Created by Al Faruk on 6/1/25.
//

import Foundation
import Combine
import Resolver

class RequestOtpUseCase {
    @Injected private var smsRepo: SmsApiRepo
    
    func invoke(otp: Otp) -> AnyPublisher<OtpDto, Error> {
        
        smsRepo.requestOtp(otp: otp).eraseToAnyPublisher()
    }
}
