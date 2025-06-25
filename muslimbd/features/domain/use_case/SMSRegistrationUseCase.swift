//
//  SMSRegistrationUseCase.swift
//  muslimbd
//
//  Created by Al Faruk on 6/1/25.
//

import Foundation
import Combine
import Resolver

class SMSRegistrationUseCase {
    @Injected private var smsRepo: SmsApiRepo
    
    func invoke(body: SMSRegistration) -> AnyPublisher<SMSRegistrationResponseDto, Error> {
        
        smsRepo.smsRegistration(body: body).eraseToAnyPublisher()
    }
}
