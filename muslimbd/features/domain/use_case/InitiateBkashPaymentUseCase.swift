//
//  InitiateBkashPaymentUseCase.swift
//  muslimbd
//
//  Created by Al Faruk on 6/1/25.
//

import Foundation
import Combine
import Resolver

class InitiateBkashPaymentUseCase {
    @Injected private var paymentRepo: PaymentApiRepo
    
    func invoke(body: BKash, token: String) -> AnyPublisher<BKashResponseDto, Error> {
        
        paymentRepo.initiateBkash(body: body, token: token).eraseToAnyPublisher()
    }
}
