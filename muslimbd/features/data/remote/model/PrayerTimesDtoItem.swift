//
//  PrayerTimesDtoItem.swift
//  muslimbd
//
//  Created by Al Faruk on 31/12/24.
//

import Foundation

struct PrayerTimesDtoItem : Codable {
    internal init(asr: String? = nil, date_month: String? = nil, day_no: Int? = nil, day_no_leap_year: Int? = nil, fazr: String? = nil, isha: String? = nil, ishraq: String? = nil, juhr: String? = nil, magrib: String? = nil, noon: String? = nil, sehri: String? = nil, sunrise: String? = nil, tahajjut: String? = nil) {
        self.asr = asr
        self.date_month = date_month
        self.day_no = day_no
        self.day_no_leap_year = day_no_leap_year
        self.fazr = fazr
        self.isha = isha
        self.ishraq = ishraq
        self.juhr = juhr
        self.magrib = magrib
        self.noon = noon
        self.sehri = sehri
        self.sunrise = sunrise
        self.tahajjut = tahajjut
    }
    
    let asr: String?
    let date_month: String?
    let day_no: Int?
    let day_no_leap_year: Int?
    let fazr: String?
    let isha: String?
    let ishraq: String?
    let juhr: String?
    let magrib: String?
    let noon: String?
    let sehri: String?
    let sunrise: String?
    let tahajjut: String?
}
