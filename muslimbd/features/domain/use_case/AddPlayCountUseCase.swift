//
//  AddPlayCountUseCase.swift
//  muslimbd
//
//  Created by Al Faruk on 2/1/25.
//

import Foundation
import Combine
import Resolver

class AddPlayCountUseCase {
    @Injected private var apiRepo: ApiRepo
    
    func invoke(body: PlayCount) -> AnyPublisher<DefaultDto, Error> {
        apiRepo.addPlayCount(body: body).eraseToAnyPublisher()
    }
}
