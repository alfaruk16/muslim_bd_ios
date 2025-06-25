//
//  AlQuranDtoItem.swift
//  muslimbd
//
//  Created by Al Faruk on 31/12/24.
//

import Foundation

struct AlQuranDtoItem  : Codable{
    internal init(about: String? = nil, appLanguage: String? = nil, ayats: String? = nil, contentBaseUrl: String? = nil, contentUrl: String? = nil, createdBy: String? = nil, createdOn: String? = nil, duration: String? = nil, id: String? = nil, imageUrl: String? = nil, isActive: Bool? = nil, name: String? = nil, nameInArabic: String? = nil, nameMeaning: String? = nil, origin: String? = nil, pronunciation: String? = nil, sequenceNo: Int? = nil, totalAyat: Int? = nil, updatedBy: String? = nil, updatedOn: String? = nil, userFavouritedThis: Bool? = nil) {
        self.about = about
        self.appLanguage = appLanguage
        self.ayats = ayats
        self.contentBaseUrl = contentBaseUrl
        self.contentUrl = contentUrl
        self.createdBy = createdBy
        self.createdOn = createdOn
        self.duration = duration
        self.id = id
        self.imageUrl = imageUrl
        self.isActive = isActive
        self.name = name
        self.nameInArabic = nameInArabic
        self.nameMeaning = nameMeaning
        self.origin = origin
        self.pronunciation = pronunciation
        self.sequenceNo = sequenceNo
        self.totalAyat = totalAyat
        self.updatedBy = updatedBy
        self.updatedOn = updatedOn
        self.userFavouritedThis = userFavouritedThis
    }
    
    let about: String?
    let appLanguage: String?
    let ayats: String?
    let contentBaseUrl: String?
    let contentUrl: String?
    let createdBy: String?
    let createdOn: String?
    let duration: String?
    let id: String?
    let imageUrl: String?
    let isActive: Bool?
    let name: String?
    let nameInArabic: String?
    let nameMeaning: String?
    let origin: String?
    let pronunciation: String?
    let sequenceNo: Int?
    let totalAyat: Int?
    let updatedBy: String?
    let updatedOn: String?
    let userFavouritedThis: Bool?
}


extension AlQuranDtoItem {
    func copy(
            about: String?? = nil,
            appLanguage: String?? = nil,
            ayats: String?? = nil,
            contentBaseUrl: String?? = nil,
            contentUrl: String?? = nil,
            createdBy: String?? = nil,
            createdOn: String?? = nil,
            duration: String?? = nil,
            id: String?? = nil,
            imageUrl: String?? = nil,
            isActive: Bool?? = nil,
            name: String?? = nil,
            nameInArabic: String?? = nil,
            nameMeaning: String?? = nil,
            origin: String?? = nil,
            pronunciation: String?? = nil,
            sequenceNo: Int?? = nil,
            totalAyat: Int?? = nil,
            updatedBy: String?? = nil,
            updatedOn: String?? = nil,
            userFavouritedThis: Bool?? = nil
        ) -> AlQuranDtoItem {
            return AlQuranDtoItem(
                about: about ?? self.about,
                appLanguage: appLanguage ?? self.appLanguage,
                ayats: ayats ?? self.ayats,
                contentBaseUrl: contentBaseUrl ?? self.contentBaseUrl,
                contentUrl: contentUrl ?? self.contentUrl,
                createdBy: createdBy ?? self.createdBy,
                createdOn: createdOn ?? self.createdOn,
                duration: duration ?? self.duration,
                id: id ?? self.id,
                imageUrl: imageUrl ?? self.imageUrl,
                isActive: isActive ?? self.isActive,
                name: name ?? self.name,
                nameInArabic: nameInArabic ?? self.nameInArabic,
                nameMeaning: nameMeaning ?? self.nameMeaning,
                origin: origin ?? self.origin,
                pronunciation: pronunciation ?? self.pronunciation,
                sequenceNo: sequenceNo ?? self.sequenceNo,
                totalAyat: totalAyat ?? self.totalAyat,
                updatedBy: updatedBy ?? self.updatedBy,
                updatedOn: updatedOn ?? self.updatedOn,
                userFavouritedThis: userFavouritedThis ?? self.userFavouritedThis
            )
        }
}
