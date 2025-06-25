//
//  CheckIsFavoriteUseCase.swift
//  muslimbd
//
//  Created by Al Faruk on 5/1/25.
//

import Foundation
import Combine
import Resolver

class CheckIsFavoriteUseCase {
    @Injected private var apiRepo: ApiRepo
    
    func invoke(trackId: String) -> AnyPublisher<DefaultDto, Error> {
        apiRepo.isFavorite(id: trackId).eraseToAnyPublisher()
    }
}
