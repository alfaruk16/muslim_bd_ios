//
//  ArtistDtoItem.swift
//  muslimbd
//
//  Created by Al Faruk on 31/12/24.
//

import Foundation

struct ArtistDtoItem : Codable {
    internal init(about: String? = nil, appLanguage: String? = nil, contentBaseUrl: String? = nil, contentUrl: String? = nil, createdBy: String? = nil, createdOn: String? = nil, id: String? = nil, imageUrl: String? = nil, isActive: Bool? = nil, name: String? = nil, sequenceNo: Int? = nil, updatedBy: String? = nil, updatedOn: String? = nil, totalTrack: Int? = nil) {
        self.about = about
        self.appLanguage = appLanguage
        self.contentBaseUrl = contentBaseUrl
        self.contentUrl = contentUrl
        self.createdBy = createdBy
        self.createdOn = createdOn
        self.id = id
        self.imageUrl = imageUrl
        self.isActive = isActive
        self.name = name
        self.sequenceNo = sequenceNo
        self.updatedBy = updatedBy
        self.updatedOn = updatedOn
        self.totalTrack = totalTrack
    }
    
    let about: String?
    let appLanguage: String?
    let contentBaseUrl: String?
    let contentUrl: String?
    let createdBy: String?
    let createdOn: String?
    let id: String?
    var imageUrl: String?
    let isActive: Bool?
    let name: String?
    let sequenceNo: Int?
    let updatedBy: String?
    let updatedOn: String?
    let totalTrack: Int?
}

extension ArtistDtoItem {
    func copy(
        about: String? = nil,
        appLanguage: String? = nil,
        contentBaseUrl: String? = nil,
        contentUrl: String? = nil,
        createdBy: String? = nil,
        createdOn: String? = nil,
        id: String? = nil,
        imageUrl: String? = nil,
        isActive: Bool? = nil,
        name: String? = nil,
        sequenceNo: Int? = nil,
        updatedBy: String? = nil,
        updatedOn: String? = nil,
        totalTrack: Int? = nil
    ) -> ArtistDtoItem {
        return ArtistDtoItem(
            about: about ?? self.about,
            appLanguage: appLanguage ?? self.appLanguage,
            contentBaseUrl: contentBaseUrl ?? self.contentBaseUrl,
            contentUrl: contentUrl ?? self.contentUrl,
            createdBy: createdBy ?? self.createdBy,
            createdOn: createdOn ?? self.createdOn,
            id: id ?? self.id,
            imageUrl: imageUrl ?? self.imageUrl,
            isActive: isActive ?? self.isActive,
            name: name ?? self.name,
            sequenceNo: sequenceNo ?? self.sequenceNo,
            updatedBy: updatedBy ?? self.updatedBy,
            updatedOn: updatedOn ?? self.updatedOn,
            totalTrack: totalTrack ?? self.totalTrack
        )
    }
}
