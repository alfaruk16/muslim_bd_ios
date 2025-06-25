//
//  NagadApiRepo.swift
//  muslimbd
//
//  Created by Al Faruk on 6/1/25.
//

import Foundation
import Combine

protocol NagadApiRepo {
    func initiateNagad(body: Nagad) -> AnyPublisher<NagadResponseDto, Error>
}
