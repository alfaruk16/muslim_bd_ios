//
//  GetParaUseCase.swift
//  muslimbd
//
//  Created by Al Faruk on 5/1/25.
//

import Foundation
import Combine
import Resolver

class GetParaUseCase {
    @Injected private var apiRepo: ApiRepo
    
    func invoke(id: String) -> AnyPublisher<ParaDto, Error> {
        apiRepo.getPara(id: id).eraseToAnyPublisher()
    }
}
