//
//  IslamicNamesDtoItem.swift
//  muslimbd
//
//  Created by Al Faruk on 31/12/24.
//

import Foundation

struct IslamicNamesDtoItem : Codable {
    internal init(about: String? = nil, appLanguage: String? = nil, createdBy: String? = nil, createdOn: String? = nil, gender: String? = nil, id: String? = nil, isActive: Bool? = nil, meaning: String? = nil, name: String? = nil, nameInArabic: String? = nil, pronunciation: String? = nil, sequenceNo: Int? = nil, updatedBy: String? = nil, updatedOn: String? = nil, userFavouritedThis: Bool? = nil) {
        self.about = about
        self.appLanguage = appLanguage
        self.createdBy = createdBy
        self.createdOn = createdOn
        self.gender = gender
        self.id = id
        self.isActive = isActive
        self.meaning = meaning
        self.name = name
        self.nameInArabic = nameInArabic
        self.pronunciation = pronunciation
        self.sequenceNo = sequenceNo
        self.updatedBy = updatedBy
        self.updatedOn = updatedOn
        self.userFavouritedThis = userFavouritedThis
    }
    
    let about: String?
    let appLanguage: String?
    let createdBy: String?
    let createdOn: String?
    let gender: String?
    let id: String?
    let isActive: Bool?
    let meaning: String?
    let name: String?
    let nameInArabic: String?
    let pronunciation: String?
    let sequenceNo: Int?
    let updatedBy: String?
    let updatedOn: String?
    let userFavouritedThis: Bool?
}
