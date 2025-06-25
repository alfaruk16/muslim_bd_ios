//
//  GetVideoTrackUseCase.swift
//  muslimbd
//
//  Created by Al Faruk on 2/1/25.
//

import Foundation
import Combine
import Resolver

class GetVideoTrackUseCase {
    @Injected private var apiRepo: ApiRepo
    
    func invoke(id: String) -> AnyPublisher<TracksDto, Error> {
        apiRepo.getVideoTracks().map { response in
                        
            return response.copy(data: response.data?.filter({$0.isActive == true}))
            
        }.eraseToAnyPublisher()
    }
}
