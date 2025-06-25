//
//  PrayerTimeCitiesDtoData.swift
//  muslimbd
//
//  Created by Al Faruk on 31/12/24.
//

import Foundation

struct PrayerTimeCitiesDtoData : Codable {
    internal init(asr: Double? = nil, divisionId: Double? = nil, fazr: Double? = nil, iftar: Double? = nil, isha: Double? = nil, ishrak: Double? = nil, johr: Double? = nil, lat: Double? = 23.810331344604492, lng: Double? = 90.41252136230469, magrib: Double? = nil, placeName: String? = "ঢাকা", placeNameEng: String? = "Dhaka", seheri: Double? = nil, sunrise: Double? = nil, sunset: Double? = nil, tahajjud: Double? = nil) {
        self.asr = asr
        self.divisionId = divisionId
        self.fazr = fazr
        self.iftar = iftar
        self.isha = isha
        self.ishrak = ishrak
        self.johr = johr
        self.lat = lat
        self.lng = lng
        self.magrib = magrib
        self.placeName = placeName
        self.placeNameEng = placeNameEng
        self.seheri = seheri
        self.sunrise = sunrise
        self.sunset = sunset
        self.tahajjud = tahajjud
    }
    
    let asr: Double?
    let divisionId: Double?
    let fazr: Double?
    let iftar: Double?
    let isha: Double?
    let ishrak: Double?
    let johr: Double?
    let lat: Double?
    let lng: Double?
    let magrib: Double?
    let placeName: String?
    let placeNameEng: String?
    let seheri: Double?
    let sunrise: Double?
    let sunset: Double?
    let tahajjud: Double?
}
