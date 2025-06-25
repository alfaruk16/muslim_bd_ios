//
//  GetPrayerTimesMonthlyUseCase.swift
//  muslimbd
//
//  Created by Al Faruk on 5/1/25.
//

import Foundation
import Combine
import Resolver

class GetPrayerTimesMonthlyUseCase {
    @Injected private var apiRepo: ApiRepo
    
    func invoke() -> AnyPublisher<PrayerTimesDto, Error> {
        apiRepo.getMonthlyPrayerTimes().eraseToAnyPublisher()
    }
}
