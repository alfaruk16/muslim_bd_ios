//
//  CancelBanglalinkUseCase.swift
//  muslimbd
//
//  Created by Al Faruk on 6/1/25.
//

import Foundation
import Combine
import Resolver

class CancelBanglalinkUseCase {
    @Injected private var paymentRepo: PaymentApiRepo
    
    func invoke(body: Banglalink) -> AnyPublisher<TelcoResponseDto, Error> {
        paymentRepo.cancelBanglalink(body: body).eraseToAnyPublisher()
    }
}
