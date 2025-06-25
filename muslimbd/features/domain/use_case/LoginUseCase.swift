//
//  LoginUseCase.swift
//  muslimbd
//
//  Created by Al Faruk on 2/1/25.
//

import Foundation
import Combine
import Resolver

class LoginUseCase {
    @Injected private var apiRepo: ApiRepo
    
    func invoke(body: Login) -> AnyPublisher<LoginDto, Error> {
        apiRepo.login(body: body).eraseToAnyPublisher()
    }
}
