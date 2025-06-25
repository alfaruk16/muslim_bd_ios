//
//  GetScholarTrackByIdUseCase.swift
//  muslimbd
//
//  Created by Al Faruk on 5/1/25.
//

import Foundation
import Combine
import Resolver

class GetScholarTrackByIdUseCase {
    @Injected private var apiRepo: ApiRepo
    
    func invoke(id: String) -> AnyPublisher<ScholarTrackDto, Error> {
        apiRepo.getScholarTrackById(id: id).eraseToAnyPublisher()
    }
}
