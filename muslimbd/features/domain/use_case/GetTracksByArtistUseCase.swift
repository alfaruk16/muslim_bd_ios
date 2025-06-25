//
//  GetTracksByArtistUseCase.swift
//  muslimbd
//
//  Created by Al Faruk on 2/1/25.
//

import Foundation
import Combine
import Resolver

class GetTracksByArtistUseCase {
    @Injected private var apiRepo: ApiRepo
    
    func invoke(artistId: String, type: String) -> AnyPublisher<TracksDto, Error> {
        apiRepo.getTracksByArtist(type: type, id: artistId).map { response in
            
            return response.copy(data: response.data?.filter({$0.isActive == true}))
            
        }.eraseToAnyPublisher()
    }
}
