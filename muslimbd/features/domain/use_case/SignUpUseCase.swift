//
//  SignUpUseCase.swift
//  muslimbd
//
//  Created by Al Faruk on 2/1/25.
//

import Foundation
import Combine
import Resolver

class SignUpUseCase {
    @Injected private var apiRepo: ApiRepo
    
    func invoke(body: SignUp) -> AnyPublisher<SignUpDto, Error> {
        apiRepo.signUp(body: body).eraseToAnyPublisher()
    }
}
