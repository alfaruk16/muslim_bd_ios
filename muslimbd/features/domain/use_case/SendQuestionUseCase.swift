//
//  SendQuestionUseCase.swift
//  muslimbd
//
//  Created by Al Faruk on 2/1/25.
//

import Foundation
import Combine
import Resolver

class SendQuestionUseCase {
    @Injected private var apiRepo: ApiRepo
    
    func invoke(body: Question) -> AnyPublisher<DefaultDto, Error> {
        apiRepo.sendQuestion(body: body).eraseToAnyPublisher()
    }
}
