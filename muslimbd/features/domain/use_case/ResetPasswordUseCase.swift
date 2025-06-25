//
//  ResetPasswordUseCase.swift
//  muslimbd
//
//  Created by Al Faruk on 2/1/25.
//

import Foundation
import Combine
import Resolver

class ResetPasswordUseCase {
    @Injected private var apiRepo: ApiRepo
    
    func invoke(userName: String, password: String) -> AnyPublisher<DefaultDto, Error> {
        apiRepo.resetPassword(userName: userName, password: password, type: "mb").eraseToAnyPublisher()
    }
}
