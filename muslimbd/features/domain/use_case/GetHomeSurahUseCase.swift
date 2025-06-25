//
//  GetHomeSurahUseCase.swift
//  muslimbd
//
//  Created by Al Faruk on 5/1/25.
//

import Foundation
import Combine
import Resolver

class GetHomeSurahUseCase {
    @Injected private var apiRepo: ApiRepo
    
    func invoke() -> AnyPublisher<AlQuranDto, Error> {
        
        apiRepo.getHomeSurah().eraseToAnyPublisher()
    }
}
