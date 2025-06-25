//
//  InitiateAmarPayUseCase.swift
//  muslimbd
//
//  Created by Al Faruk on 6/1/25.
//

import Foundation
import Combine
import Resolver

class InitiateAmarPayUseCase {
    @Injected private var paymentRepo: PaymentApiRepo
    
    func invoke(body: AmarPay) -> AnyPublisher<AmarPayResponseDto, Error> {
        
        paymentRepo.initiateAmarPay(body: body).eraseToAnyPublisher()
    }
}
