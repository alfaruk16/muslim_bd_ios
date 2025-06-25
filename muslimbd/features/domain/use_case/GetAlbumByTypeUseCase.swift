//
//  GetAlbumByTypeUseCase.swift
//  muslimbd
//
//  Created by Al Faruk on 5/1/25.
//

import Foundation
import Combine
import Resolver

class GetAlbumByTypeUseCase {
    @Injected private var apiRepo: ApiRepo
    
    func invoke(type: String) -> AnyPublisher<AlbumDto, Error> {
        apiRepo.getAlbumByType(type: type).map({response in
            return response.copy(data: response.data?.filter({$0.isActive == true}))
        }).eraseToAnyPublisher()
    }
}
