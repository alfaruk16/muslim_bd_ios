//
//  GetAllahNamesUseCase.swift
//  muslimbd
//
//  Created by Al Faruk on 5/1/25.
//

import Foundation
import Combine
import Resolver

class GetAllahNamesUseCase {
    @Injected private var apiRepo: ApiRepo
    
    func invoke() -> AnyPublisher<AllahNamesDto, Error> {
        
        apiRepo.getAllahNames().eraseToAnyPublisher()
    }
}
