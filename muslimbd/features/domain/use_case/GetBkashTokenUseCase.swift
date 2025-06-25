//
//  GetBkashTokenUseCase.swift
//  muslimbd
//
//  Created by Al Faruk on 6/1/25.
//

import Foundation
import Combine
import Resolver

class GetBkashTokenUseCase {
    @Injected private var paymentRepo: PaymentApiRepo
    
    func invoke(body: BkashToken) -> AnyPublisher<BkashTokenResponseDto, Error> {
        
        paymentRepo.getBKashToken(body: body).eraseToAnyPublisher()
    }
}
