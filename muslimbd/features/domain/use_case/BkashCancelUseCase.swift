//
//  BkashCancelUseCase.swift
//  muslimbd
//
//  Created by Al Faruk on 6/1/25.
//

import Foundation
import Combine
import Resolver

class BkashCancelUseCase {
    @Injected private var paymentRepo: PaymentApiRepo
    
    func invoke(body: BkashCancel) -> AnyPublisher<CancelDto, Error> {
        paymentRepo.bkashCancelPlan(body: body).eraseToAnyPublisher()
    }
}
