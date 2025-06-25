//
//  GetArtistById.swift
//  muslimbd
//
//  Created by Al Faruk on 5/1/25.
//

import Foundation
import Combine
import Resolver

class GetArtistById {
    @Injected private var apiRepo: ApiRepo
    
    func invoke(id: String) -> AnyPublisher<SingleArtistDto, Error> {
        
        apiRepo.getArtistById(id: id).eraseToAnyPublisher()
    }
}
