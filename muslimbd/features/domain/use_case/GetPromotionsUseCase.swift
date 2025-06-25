//
//  GetPromotionsUseCase.swift
//  muslimbd
//
//  Created by Al Faruk on 5/1/25.
//

import Foundation
import Combine
import Resolver

class GetPromotionsUseCase {
    @Injected private var apiRepo: ApiRepo
    
    func invoke() -> AnyPublisher<PromotionsDto, Error> {
        apiRepo.getPromotions().eraseToAnyPublisher()
    }
}
