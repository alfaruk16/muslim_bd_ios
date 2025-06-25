//
//  GetAllParaUseCase.swift
//  muslimbd
//
//  Created by Al Faruk on 5/1/25.
//

import Foundation
import Combine
import Resolver

class GetAllParaUseCase {
    @Injected private var apiRepo: ApiRepo
    
    func invoke() -> AnyPublisher<AllParaDto, Error> {
        apiRepo.getAllPara().eraseToAnyPublisher()
    }
}
