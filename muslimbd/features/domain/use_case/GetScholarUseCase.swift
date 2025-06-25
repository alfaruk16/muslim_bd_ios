//
//  GetScholarUseCase.swift
//  muslimbd
//
//  Created by Al Faruk on 5/1/25.
//

import Foundation
import Combine
import Resolver

class GetScholarUseCase {
    @Injected private var apiRepo: ApiRepo
    
    func invoke() -> AnyPublisher< ArtistDto, Error> {
        apiRepo.getScholar().map({response in
            return response.copy(data: response.data?.filter({$0.isActive == true}))
        }).eraseToAnyPublisher()
    }
}
