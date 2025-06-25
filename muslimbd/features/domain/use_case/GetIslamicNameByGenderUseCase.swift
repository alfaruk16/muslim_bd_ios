//
//  GetIslamicNameByGenderUseCase.swift
//  muslimbd
//
//  Created by Al Faruk on 5/1/25.
//

import Foundation
import Combine
import Resolver

class GetIslamicNameByGenderUseCase {
    @Injected private var apiRepo: ApiRepo
    
    func invoke(gender: String) -> AnyPublisher<IslamicNamesDto, Error> {
        apiRepo.getIslamicNames(gender: gender).map({response in
            return response.copy(data: response.data?.reversed())
        }).eraseToAnyPublisher()
    }
}
