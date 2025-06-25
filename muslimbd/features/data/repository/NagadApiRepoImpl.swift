//
//  NagadApiRepoImpl.swift
//  muslimbd
//
//  Created by Al Faruk on 6/1/25.
//

import Foundation
import Combine
import Resolver

class NagadApiRepoImpl: NagadApiRepo {
    @Injected private var client: RestClient
    
    func initiateNagad(body: Nagad) -> AnyPublisher<NagadResponseDto, any Error> {
        client.post(APIEndpoint.initiateNagad, using: body)
    }
}
