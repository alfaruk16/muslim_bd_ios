//
//  GetProfileUseCase.swift
//  muslimbd
//
//  Created by Al Faruk on 5/1/25.
//

import Foundation
import Combine
import Resolver

class GetProfileUseCase {
    @Injected private var apiRepo: ApiRepo
    
    func invoke() -> AnyPublisher<ProfileDto, Error> {
        apiRepo.getProfile().eraseToAnyPublisher()
    }
}
