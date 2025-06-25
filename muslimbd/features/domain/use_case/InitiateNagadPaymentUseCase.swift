//
//  InitiateNagadPaymentUseCase.swift
//  muslimbd
//
//  Created by Al Faruk on 6/1/25.
//

import Foundation
import Combine
import Resolver

class InitiateNagadPaymentUseCase {
    @Injected private var nagadRepo: NagadApiRepo
    
    func invoke(body: Nagad) -> AnyPublisher<NagadResponseDto, Error> {
        
        nagadRepo.initiateNagad(body: body).eraseToAnyPublisher()
    }
}
