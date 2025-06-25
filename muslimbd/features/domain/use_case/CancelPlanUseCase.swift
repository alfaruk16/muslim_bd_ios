//
//  CancelPlanUseCase.swift
//  muslimbd
//
//  Created by Al Faruk on 6/1/25.
//

import Foundation
import Combine
import Resolver

class CancelPlanUseCase {
    @Injected private var paymentApi: PaymentApiRepo
    
    func invoke(body: SSL) -> AnyPublisher<CancelDto, Error>{
        
        paymentApi.cancelPlan(body: body).eraseToAnyPublisher()
    }
}
