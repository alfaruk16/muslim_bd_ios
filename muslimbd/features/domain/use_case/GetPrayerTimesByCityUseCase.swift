//
//  GetPrayerTimesByCityUseCase.swift
//  muslimbd
//
//  Created by Al Faruk on 5/1/25.
//

import Foundation
import Combine
import Resolver

class GetPrayerTimesByCityUseCase {
    @Injected private var apiRepo: ApiRepo
    
    func invoke() -> AnyPublisher<PrayerTimeCitiesDto, Error> {
        apiRepo.getPrayerTimesByCity().eraseToAnyPublisher()
    }
}
