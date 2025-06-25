//
//  GetTrackByIdUseCase.swift
//  muslimbd
//
//  Created by Al Faruk on 2/1/25.
//

import Foundation
import Combine
import Resolver

class GetTrackByIdUseCase {
    @Injected private var apiRepo: ApiRepo
    
    func invoke(id: String) -> AnyPublisher<TrackDto, Error> {
        apiRepo.getTrack(id: id).eraseToAnyPublisher()
    }
}
