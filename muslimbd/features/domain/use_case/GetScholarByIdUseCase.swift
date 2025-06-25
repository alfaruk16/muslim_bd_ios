//
//  GetScholarByIdUseCase.swift
//  muslimbd
//
//  Created by Al Faruk on 5/1/25.
//

import Foundation
import Combine
import Resolver

class GetScholarByIdUseCase {
    @Injected private var apiRepo: ApiRepo
    
    func invoke(id: String) -> AnyPublisher<ScholarDto, Error> {
        apiRepo.getScholarById(id: id).eraseToAnyPublisher()
    }
}
