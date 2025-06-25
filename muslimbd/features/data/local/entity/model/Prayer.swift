//
//  Prayer.swift
//  muslimbd
//
//  Created by Al Faruk on 8/1/25.
//

import SwiftUI

struct Prayer {
    var id: String = UUID().uuidString
    var nowTime: String = ""
    var prayerName: String? = nil
    var time: String? = nil
    var image: ImageResource? = nil
    var nextPrayerName: String? = nil
    var nextPrayerTime: String? = nil
    var isFinished: Bool? = nil
    var sehri: String? = nil
    var iftar: String? = nil
}
