//
//  InitiateGPUseCase.swift
//  muslimbd
//
//  Created by Al Faruk on 6/1/25.
//

import Foundation
import Combine
import Resolver

class InitiateGPPaymentUseCase {
    @Injected private var paymentRepo: PaymentApiRepo
    
    func invoke(body: GP) -> AnyPublisher<GPDto, Error> {
        
        paymentRepo.initateGp(body: body).eraseToAnyPublisher()
    }
}
