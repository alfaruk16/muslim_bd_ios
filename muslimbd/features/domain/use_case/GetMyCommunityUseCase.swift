//
//  GetMyCommunityUseCase.swift
//  muslimbd
//
//  Created by Al Faruk on 5/1/25.
//

import Foundation
import Combine
import Resolver

class GetMyCommunityUseCase {
    @Injected private var apiRepo: ApiRepo
    
    func invoke() -> AnyPublisher<CommunityAllDto, Error> {
        apiRepo.getCommunityAll().map({ response in
            return response.copy(data: response.data?.filter({$0.isActive == true}).reversed())
        }).eraseToAnyPublisher()
    }
}
