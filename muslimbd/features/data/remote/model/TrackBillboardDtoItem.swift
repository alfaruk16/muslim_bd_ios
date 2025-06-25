//
//  TrackBillboardDtoItem.swift
//  muslimbd
//
//  Created by Al Faruk on 31/12/24.
//

import Foundation

struct TrackBillboardDtoItem : Codable {
    internal init(about: String? = nil, appLanguage: String? = nil, contentBaseUrl: String? = nil, contentCategory: String? = nil, contentType: String? = nil, createdBy: String? = nil, createdOn: String? = nil, id: String? = nil, imageUrl: String? = nil, isActive: Bool? = nil, sequenceNo: Int? = nil, shortStreamUrl: String? = nil, targetId: String? = nil, title: String? = nil, updatedBy: String? = nil, updatedOn: String? = nil) {
        self.about = about
        self.appLanguage = appLanguage
        self.contentBaseUrl = contentBaseUrl
        self.contentCategory = contentCategory
        self.contentType = contentType
        self.createdBy = createdBy
        self.createdOn = createdOn
        self.id = id
        self.imageUrl = imageUrl
        self.isActive = isActive
        self.sequenceNo = sequenceNo
        self.shortStreamUrl = shortStreamUrl
        self.targetId = targetId
        self.title = title
        self.updatedBy = updatedBy
        self.updatedOn = updatedOn
    }
    
    let about: String?
    let appLanguage: String?
    let contentBaseUrl: String?
    let contentCategory: String?
    let contentType: String?
    let createdBy: String?
    let createdOn: String?
    let id: String?
    let imageUrl: String?
    let isActive: Bool?
    let sequenceNo: Int?
    let shortStreamUrl: String?
    let targetId: String?
    let title: String?
    let updatedBy: String?
    let updatedOn: String?
}


extension TrackBillboardDtoItem{
    func toTrackDtoItem() -> TracksDtoItem {
        return TracksDtoItem(
            about : about,
            appLanguage : appLanguage,
            contentBaseUrl : contentBaseUrl,
            contentCategory : contentCategory,
            createdBy : createdBy,
            createdOn : createdOn,
            id : targetId,
            imageUrl : imageUrl,
            isActive : isActive,
            sequenceNo : sequenceNo,
            streamUrl : shortStreamUrl,
            title : title,
            updatedBy : updatedBy,
            updatedOn : updatedOn
        )
    }
}
