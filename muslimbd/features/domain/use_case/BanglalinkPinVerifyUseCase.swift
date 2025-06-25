//
//  BanglalinkPinVerifyUseCase.swift
//  muslimbd
//
//  Created by Al Faruk on 6/1/25.
//

import Foundation
import Combine
import Resolver

class BanglalinkPinVerifyUseCase {
    @Injected private var paymentRepo: PaymentApiRepo
    
    func invoke(body: PinVerify) -> AnyPublisher<TelcoResponseDto, Error> {
        
        paymentRepo.banglalinkPinVerify(body: body).eraseToAnyPublisher()
    }
}
