//
//  PromotionsDtoItem.swift
//  muslimbd
//
//  Created by Al Faruk on 31/12/24.
//

import Foundation

struct PromotionsDtoItem : Codable {
    internal init(appLanguage: String? = nil, appTypes: String? = nil, contentId: String? = nil, contentType: String? = nil, createdBy: String? = nil, createdOn: String? = nil, endDate: String? = nil, hostName: String? = nil, id: Int? = nil, imageUrl: String? = nil, isActive: Bool? = nil, startDate: String, updatedBy: String, updatedOn: String? = nil, contentBaseUrl: String? = nil) {
        self.appLanguage = appLanguage
        self.appTypes = appTypes
        self.contentId = contentId
        self.contentType = contentType
        self.createdBy = createdBy
        self.createdOn = createdOn
        self.endDate = endDate
        self.hostName = hostName
        self.id = id
        self.imageUrl = imageUrl
        self.isActive = isActive
        self.startDate = startDate
        self.updatedBy = updatedBy
        self.updatedOn = updatedOn
        self.contentBaseUrl = contentBaseUrl
    }
    
    let appLanguage: String?
    let appTypes: String?
    let contentId: String?
    let contentType: String?
    let createdBy: String?
    let createdOn: String?
    let endDate: String?
    let hostName: String?
    let id: Int?
    let imageUrl: String?
    let isActive: Bool?
    let startDate: String
    let updatedBy: String
    let updatedOn: String?
    let contentBaseUrl: String?
}
