//
//  CategoryState.swift
//  muslimbd
//
//  Created by Al Faruk on 12/1/25.
//

struct AllPrayerState {
    internal init(isLoading: Bool = false, prayerTimes: PrayerTimesDto = PrayerTimesDto(), prayerTime: [Prayer] = [], otherTimes: [Prayer] = [], cityPrayerTimes: PrayerTimeCitiesDto = PrayerTimeCitiesDto(), city: PrayerTimeCitiesDtoData = PrayerTimeCitiesDtoData(), currentPrayer: Int = 0, playingId: String = "", dateTime: String = "", currentDate: Int = 0, arabicDate: String = "") {
        self.isLoading = isLoading
        self.prayerTimes = prayerTimes
        self.prayerTime = prayerTime
        self.otherTimes = otherTimes
        self.cityPrayerTimes = cityPrayerTimes
        self.city = city
        self.currentPrayer = currentPrayer
        self.playingId = playingId
        self.dateTime = dateTime
        self.currentDate = currentDate
        self.arabicDate = arabicDate
    }
    
    let isLoading: Bool
    let prayerTimes: PrayerTimesDto
    let prayerTime: [Prayer]
    let otherTimes: [Prayer]
    let cityPrayerTimes: PrayerTimeCitiesDto
    let city: PrayerTimeCitiesDtoData
    let currentPrayer: Int
    let playingId: String
    let dateTime: String
    let currentDate: Int
    let arabicDate: String
}

extension AllPrayerState {
    func copy(
        isLoading: Bool? = nil,
        prayerTimes: PrayerTimesDto? = nil,
        prayerTime: [Prayer]? = nil,
        otherTimes: [Prayer]? = nil,
        cityPrayerTimes: PrayerTimeCitiesDto? = nil,
        city: PrayerTimeCitiesDtoData? = nil,
        currentPrayer: Int? = nil,
        playingId: String? = nil,
        dateTime: String? = nil,
        currentDate: Int? = nil,
        arabicDate: String? = nil
    ) -> AllPrayerState {
        return AllPrayerState(
            isLoading: isLoading ?? self.isLoading,
            prayerTimes: prayerTimes ?? self.prayerTimes,
            prayerTime: prayerTime ?? self.prayerTime,
            otherTimes: otherTimes ?? self.otherTimes,
            cityPrayerTimes: cityPrayerTimes ?? self.cityPrayerTimes,
            city: city ?? self.city,
            currentPrayer: currentPrayer ?? self.currentPrayer,
            playingId: playingId ?? self.playingId,
            dateTime: dateTime ?? self.dateTime,
            currentDate: currentDate ?? self.currentDate,
            arabicDate: arabicDate ?? self.arabicDate
        )
    }
}


