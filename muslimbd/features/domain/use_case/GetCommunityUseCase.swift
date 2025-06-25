//
//  GetCommunityUseCase.swift
//  muslimbd
//
//  Created by Al Faruk on 5/1/25.
//

import Foundation
import Combine
import Resolver

class GetCommunityUseCase {
    @Injected private var apiRepo: ApiRepo
    
    func invoke() -> AnyPublisher<CommunityAllDto, Error> {
        
        apiRepo.getCommunityAll().eraseToAnyPublisher()
    }
}
