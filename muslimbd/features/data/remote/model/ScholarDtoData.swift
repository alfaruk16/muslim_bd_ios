//
//  ScholarDtoData.swift
//  muslimbd
//
//  Created by Al Faruk on 31/12/24.
//

import Foundation

struct ScholarDtoData : Codable {
    internal init(about: String? = nil, appLanguage: String? = nil, contentBaseUrl: String? = nil, createdBy: String? = nil, createdOn: String? = nil, id: String? = nil, imageUrl: String? = nil, institute: String? = nil, isActive: Bool? = nil, name: String? = nil, sequenceNo: Int? = nil, title: String? = nil, totalFav: Int? = nil, totalTrack: Int? = nil, updatedBy: String? = nil, updatedOn: String? = nil, userFavouritedThis: Bool? = nil) {
        self.about = about
        self.appLanguage = appLanguage
        self.contentBaseUrl = contentBaseUrl
        self.createdBy = createdBy
        self.createdOn = createdOn
        self.id = id
        self.imageUrl = imageUrl
        self.institute = institute
        self.isActive = isActive
        self.name = name
        self.sequenceNo = sequenceNo
        self.title = title
        self.totalFav = totalFav
        self.totalTrack = totalTrack
        self.updatedBy = updatedBy
        self.updatedOn = updatedOn
        self.userFavouritedThis = userFavouritedThis
    }
    
    let about: String?
    let appLanguage: String?
    let contentBaseUrl: String?
    let createdBy: String?
    let createdOn: String?
    let id: String?
    let imageUrl: String?
    let institute: String?
    let isActive: Bool?
    let name: String?
    let sequenceNo: Int?
    let title: String?
    let totalFav: Int?
    let totalTrack: Int?
    let updatedBy: String?
    let updatedOn: String?
    let userFavouritedThis: Bool?
}

extension ScholarDtoData {
    func toArtistDtoItem() -> ArtistDtoItem {
        ArtistDtoItem(
            about : about,
            appLanguage : appLanguage,
            contentBaseUrl : contentBaseUrl,
            createdBy : createdBy,
            createdOn : createdOn,
            id : id,
            imageUrl : imageUrl,
            isActive : isActive,
            name : name,
            sequenceNo : sequenceNo,
            updatedBy : updatedBy,
            updatedOn : updatedOn, totalTrack : totalTrack
        )
    }
}
