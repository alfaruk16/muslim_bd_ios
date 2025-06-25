//
//  GetScholarTrackByArtistUseCase.swift
//  muslimbd
//
//  Created by Al Faruk on 5/1/25.
//

import Foundation
import Combine
import Resolver

class GetScholarTrackByArtistUseCase {
    @Injected private var apiRepo: ApiRepo
    
    func invoke(artistId: String, type: String) -> AnyPublisher<TracksDto, Error> {
        apiRepo.getScholarTracksByArtist(type: type, id: artistId).map({response in
            return response.copy(data: response.data?.filter({$0.isActive == true}).reversed())
        }).eraseToAnyPublisher()
    }
}
