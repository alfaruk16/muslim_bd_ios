//
//  GetContentsUseCase.swift
//  muslimbd
//
//  Created by Al Faruk on 5/1/25.
//

import Foundation
import Combine
import Resolver

class GetContentsUseCase {
    @Injected private var apiRepo: ApiRepo
    
    func invoke() -> AnyPublisher<ContentsDto, Error> {
        apiRepo.getContents().eraseToAnyPublisher()
    }
}
