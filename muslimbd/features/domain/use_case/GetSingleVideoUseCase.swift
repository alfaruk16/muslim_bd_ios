//
//  GetSingleVideoUseCase.swift
//  muslimbd
//
//  Created by Al Faruk on 5/1/25.
//

import Foundation
import Combine
import Resolver

class GetSingleVideoUseCase {
    @Injected private var apiRepo: ApiRepo
    
    func invoke(id: String) ->  AnyPublisher<SingleVideoDto, Error> {
        apiRepo.getSingleVideo(id: id).eraseToAnyPublisher()
    }
}
