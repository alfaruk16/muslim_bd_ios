//
//  GetTrackBillboardUseCase.swift
//  muslimbd
//
//  Created by Al Faruk on 2/1/25.
//

import Foundation
import Combine
import Resolver

class GetTrackBillboardUseCase {
    @Injected private var apiRepo: ApiRepo
    
    func invoke() -> AnyPublisher<TrackBillboardDto, Error> {
        apiRepo.getTrackBillboard().map { response in
            return response.copy(data: response.data?.filter({$0.isActive == true}))
        }.eraseToAnyPublisher()
    }
}
