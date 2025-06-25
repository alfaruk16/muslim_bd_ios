//
//  CategoryDtoItem.swift
//  muslimbd
//
//  Created by Al Faruk on 9/12/24.
//

import Foundation
import SwiftUI

struct CategoryDtoItem: Codable {
    internal init(name: String? = nil, code: String? = nil, imageURL: String? = nil, contentBaseURL: String? = nil, userFavouritedThis: Bool? = nil, isPremium: Bool? = nil, id: String? = nil, createdBy: String? = nil, createdOn: String? = nil, updatedBy: String? = nil, updatedOn: String? = nil, isActive: Bool? = nil, appLanguage: String? = nil, sequenceNo: Int? = nil, about: String? = nil, icon: ImageResource? = nil, image: ImageResource? = nil, hasSubCategory: Bool = false, totalContent: Int? = nil, category: String? = nil, selectedTab: Int? = nil, isShortByPopular: Bool? = nil, isShortByFavorite: Bool? = nil, playIndex: Int? = nil) {
        self.name = name
        self.code = code
        self.imageURL = imageURL
        self.contentBaseURL = contentBaseURL
        self.userFavouritedThis = userFavouritedThis
        self.isPremium = isPremium
        self.id = id
        self.createdBy = createdBy
        self.createdOn = createdOn
        self.updatedBy = updatedBy
        self.updatedOn = updatedOn
        self.isActive = isActive
        self.appLanguage = appLanguage
        self.sequenceNo = sequenceNo
        self.about = about
        self.icon = icon
        self.image = image
        self.hasSubCategory = hasSubCategory
        self.totalContent = totalContent
        self.category = category
        self.selectedTab = selectedTab
        self.isShortByPopular = isShortByPopular
        self.isShortByFavorite = isShortByFavorite
        self.playIndex = playIndex
    }
    
    let name: String?
    let code: String?
    let imageURL: String?
    let contentBaseURL: String?
    let userFavouritedThis: Bool?
    let isPremium: Bool?
    let id: String?
    let createdBy: String?
    let createdOn: String?
    let updatedBy: String?
    let updatedOn: String?
    let isActive: Bool?
    let appLanguage: String?
    let sequenceNo: Int?
    let about: String?
    var icon: ImageResource?
    var image: ImageResource?
    let hasSubCategory: Bool?
    let totalContent: Int?
    let category: String?
    let selectedTab: Int?
    let isShortByPopular: Bool?
    let isShortByFavorite: Bool?
    let playIndex: Int?

    enum CodingKeys: String, CodingKey {
        case name, code
        case imageURL = "imageUrl"
        case contentBaseURL = "contentBaseUrl"
        case userFavouritedThis, isPremium, id, createdBy, createdOn, updatedBy, updatedOn, isActive, appLanguage, sequenceNo, about, hasSubCategory, totalContent, category, selectedTab, isShortByPopular, isShortByFavorite, playIndex
    }
}
