//
//  CancelFavoriteUseCase.swift
//  muslimbd
//
//  Created by Al Faruk on 5/1/25.
//

import Foundation
import Combine
import Resolver

class CancelFavoriteUseCase {
    @Injected private var apiRepo: ApiRepo
    
    func invoke(trackId: String) -> AnyPublisher<DefaultDto, Error> {
        apiRepo.cancelFavorite(id: trackId).eraseToAnyPublisher()
    }
}
