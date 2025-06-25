//
//  InitiateRobiPaymentUseCase.swift
//  muslimbd
//
//  Created by Al Faruk on 6/1/25.
//

import Foundation
import Combine
import Resolver

class InitiateRobiPaymentUseCase {
    @Injected private var paymentRepo: PaymentApiRepo
    
    func invoke(body: Robi) -> AnyPublisher<TelcoResponseDto, Error> {
        
        paymentRepo.initiateRobi(body: body).eraseToAnyPublisher()
    }
}
