//
//  GetSubscriptionUseCase.swift
//  muslimbd
//
//  Created by Al Faruk on 9/1/25.
//

import Foundation
import Combine
import Resolver

class GetSubscriptionUseCase {
    @Injected private var paymentRepo: PaymentApiRepo
    
    func invoke(body: SubStatus) -> AnyPublisher<SubstatusDto, Error> {
        paymentRepo.getSubStatus(body: body).eraseToAnyPublisher()
    }
}
