//
//  GetAlbumByIdUseCase.swift
//  muslimbd
//
//  Created by Al Faruk on 5/1/25.
//

import Foundation
import Combine
import Resolver

class GetAlbumByIdUseCase {
    @Injected private var apiRepo: ApiRepo
    
    func invoke(id: String) -> AnyPublisher<SingleAlbumDto, Error> {
        apiRepo.getAlbumById(id: id).eraseToAnyPublisher()
    }
}
