//
//  RobiPinVerifiyUseCase.swift
//  muslimbd
//
//  Created by Al Faruk on 6/1/25.
//

import Foundation
import Combine
import Resolver

class RobiPinVerifiyUseCase {
    @Injected private var paymentRepo: PaymentApiRepo
    
    func invoke(body: PinVerify) -> AnyPublisher<TelcoResponseDto, Error> {
        
        paymentRepo.robiPinVerify(body: body).eraseToAnyPublisher()
    }
}
