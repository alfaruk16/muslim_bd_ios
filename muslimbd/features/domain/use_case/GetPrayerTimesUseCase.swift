//
//  GetPrayerTimesUseCase.swift
//  muslimbd
//
//  Created by Al Faruk on 5/1/25.
//

import Foundation
import Combine
import Resolver

class GetPrayerTimesUseCase {
    @Injected private var apiRepo: ApiRepo
    
    func invoke(data: String, month: String) -> AnyPublisher<PrayerTimesDto, Error> {
        apiRepo.getPrayerTimes(date: data, month: month).eraseToAnyPublisher()
    }
}
