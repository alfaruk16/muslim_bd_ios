//
//  UpdateProfileUseCase.swift
//  muslimbd
//
//  Created by Al Faruk on 2/1/25.
//

import Foundation
import Combine
import Resolver

class UpdateProfileUseCase {
    @Injected private var apiRepo: ApiRepo
    
    func invoke(body: UpdateProfile) -> AnyPublisher<DefaultDto, Error> {
        apiRepo.updateProfile(body: body).eraseToAnyPublisher()
    }
}
