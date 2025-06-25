//
//  SurahDtoItem.swift
//  muslimbd
//
//  Created by Al Faruk on 31/12/24.
//

import Foundation

struct SurahDtoItem : Codable {
    internal init(about: String? = nil, appLanguage: String? = nil, contentBaseUrl: String? = nil, contentUrl: String? = nil, createdBy: String? = nil, createdOn: String? = nil, id: String? = nil, imageUrl: String? = nil, isActive: Bool? = nil, pronunciation: String? = nil, sequenceNo: Int? = nil, surah: String? = nil, surahId: String? = nil, text: String? = nil, textInArabic: String? = nil, updatedBy: String? = nil, updatedOn: String? = nil) {
        self.about = about
        self.appLanguage = appLanguage
        self.contentBaseUrl = contentBaseUrl
        self.contentUrl = contentUrl
        self.createdBy = createdBy
        self.createdOn = createdOn
        self.id = id
        self.imageUrl = imageUrl
        self.isActive = isActive
        self.pronunciation = pronunciation
        self.sequenceNo = sequenceNo
        self.surah = surah
        self.surahId = surahId
        self.text = text
        self.textInArabic = textInArabic
        self.updatedBy = updatedBy
        self.updatedOn = updatedOn
    }
    
    let about: String?
    let appLanguage: String?
    let contentBaseUrl: String?
    let contentUrl: String?
    let createdBy: String?
    let createdOn: String?
    let id: String?
    let imageUrl: String?
    let isActive: Bool?
    let pronunciation: String?
    let sequenceNo: Int?
    let surah: String?
    let surahId: String?
    let text: String?
    let textInArabic: String?
    let updatedBy: String?
    let updatedOn: String?
}
