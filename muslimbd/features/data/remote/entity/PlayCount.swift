//
//  PlayCount.swift
//  muslimbd
//
//  Created by Al Faruk on 31/12/24.
//

struct PlayCount: Encodable {
    let AppLanguage: String
    let ArtistId: String
    let PlayInSecond: String
    let StreamCount: String
    let TrackId: String
    let AppTypes: String = "mb"
}
