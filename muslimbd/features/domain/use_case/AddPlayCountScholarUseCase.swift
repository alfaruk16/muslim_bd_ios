//
//  AddPlayCountScholarUseCase.swift
//  muslimbd
//
//  Created by Al Faruk on 2/1/25.
//

import Foundation
import Resolver
import Combine

class AddPlayCountScholarUseCase {
    @Injected private var apiRepo: ApiRepo
    
    func invoke(body: PlayCountScholar) -> AnyPublisher<DefaultDto, Error> {
        apiRepo.addPlayCountScholar(body: body).eraseToAnyPublisher()
    }

    
}
