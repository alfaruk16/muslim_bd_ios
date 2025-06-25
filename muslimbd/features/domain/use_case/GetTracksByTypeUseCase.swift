//
//  GetTracksByTypeUseCase.swift
//  muslimbd
//
//  Created by Al Faruk on 2/1/25.
//

import Foundation
import Combine
import Resolver

class GetTracksByTypeUseCase {
    @Injected private var apiRepo: ApiRepo
    
    func invoke(type: String, skip: Int = 1, take: Int = 0) ->AnyPublisher<TracksDto, Error> {
        
        apiRepo.getTracksByType(type: type, skip: String(skip), take: String(take)).map { response in
            return response.copy(data: response.data?.filter({$0.isActive == true}))
        }.eraseToAnyPublisher()
    }
}
