//
//  TextContentDtoItem.swift
//  muslimbd
//
//  Created by Al Faruk on 31/12/24.
//

import Foundation

struct TextContentDtoItem : Codable {
    internal init(about: String? = nil, address: String? = nil, appLanguage: String? = nil, billBoardImageUrl: String? = nil, category: String? = nil, categoryName: String? = nil, contentBaseUrl: String? = nil, createdBy: String? = nil, createdOn: String? = nil, exImageFiveUrl: String? = nil, exImageFourUrl: String? = nil, exImageOneUrl: String? = nil, exImageThreeUrl: String? = nil, exImageTwoUrl: String? = nil, id: String? = nil, imageUrl: String? = nil, isActive: Bool? = nil, latitude: String? = nil, longitude: String? = nil, pronunciation: String? = nil, refUrl: String? = nil, sequenceNo: Int? = nil, subcategory: String? = nil, subcategoryName: String? = nil, text: String? = nil, textInArabic: String? = nil, title: String? = nil, updatedBy: String? = nil, updatedOn: String? = nil, userFavoriteThis: Bool? = nil) {
        self.about = about
        self.address = address
        self.appLanguage = appLanguage
        self.billBoardImageUrl = billBoardImageUrl
        self.category = category
        self.categoryName = categoryName
        self.contentBaseUrl = contentBaseUrl
        self.createdBy = createdBy
        self.createdOn = createdOn
        self.exImageFiveUrl = exImageFiveUrl
        self.exImageFourUrl = exImageFourUrl
        self.exImageOneUrl = exImageOneUrl
        self.exImageThreeUrl = exImageThreeUrl
        self.exImageTwoUrl = exImageTwoUrl
        self.id = id
        self.imageUrl = imageUrl
        self.isActive = isActive
        self.latitude = latitude
        self.longitude = longitude
        self.pronunciation = pronunciation
        self.refUrl = refUrl
        self.sequenceNo = sequenceNo
        self.subcategory = subcategory
        self.subcategoryName = subcategoryName
        self.text = text
        self.textInArabic = textInArabic
        self.title = title
        self.updatedBy = updatedBy
        self.updatedOn = updatedOn
        self.userFavoriteThis = userFavoriteThis
    }
    
    let about: String?
    let address: String?
    let appLanguage: String?
    let billBoardImageUrl: String?
    let category: String?
    let categoryName: String?
    let contentBaseUrl: String?
    let createdBy: String?
    let createdOn: String?
    let exImageFiveUrl: String?
    let exImageFourUrl: String?
    let exImageOneUrl: String?
    let exImageThreeUrl: String?
    let exImageTwoUrl: String?
    let id: String?
    let imageUrl: String?
    let isActive: Bool?
    let latitude: String?
    let longitude: String?
    let pronunciation: String?
    let refUrl: String?
    let sequenceNo: Int?
    let subcategory: String?
    let subcategoryName: String?
    let text: String?
    let textInArabic: String?
    let title: String?
    let updatedBy: String?
    let updatedOn: String?
    let userFavoriteThis: Bool?
}
