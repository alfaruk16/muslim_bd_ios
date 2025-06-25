//
//  SetFavoriteUseCase.swift
//  muslimbd
//
//  Created by Al Faruk on 2/1/25.
//

import Foundation
import Combine
import Resolver

class SetFavoriteUseCase {
    @Injected private var apiRepo: ApiRepo
    
    func invoke(body: Favorite) -> AnyPublisher<DefaultDto, Error> {
        apiRepo.setFavorite(id: body.trackId, artistId: body.albumId).eraseToAnyPublisher()
    }
}
