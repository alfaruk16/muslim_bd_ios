//
//  InitiateBanglalinkPaymentUseCase.swift
//  muslimbd
//
//  Created by Al Faruk on 6/1/25.
//

import Foundation
import Combine
import Resolver

class InitiateBanglalinkPaymentUseCase {
    @Injected private var paymentApi: PaymentApiRepo
    
    func invoke(body: Banglalink) -> AnyPublisher<TelcoResponseDto, Error> {
        
        paymentApi.initiateBanglalink(body: body).eraseToAnyPublisher()
    }
}
