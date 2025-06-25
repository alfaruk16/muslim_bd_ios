//
//  AllahNamesDtoItem.swift
//  muslimbd
//
//  Created by Al Faruk on 31/12/24.
//

struct AllahNamesDtoItem : Codable {
    internal init(about: String? = nil, appLanguage: String? = nil, arabic: String? = nil, contentBaseUrl: String? = nil, contentUrl: String? = nil, createdBy: String? = nil, createdOn: String? = nil, fazilat: String? = nil, id: String? = nil, imageUrl: String? = nil, isActive: Bool? = nil, meaning: String? = nil, name: String? = nil, sequenceNo: Int? = nil, updatedBy: String? = nil, updatedOn: String? = nil) {
        self.about = about
        self.appLanguage = appLanguage
        self.arabic = arabic
        self.contentBaseUrl = contentBaseUrl
        self.contentUrl = contentUrl
        self.createdBy = createdBy
        self.createdOn = createdOn
        self.fazilat = fazilat
        self.id = id
        self.imageUrl = imageUrl
        self.isActive = isActive
        self.meaning = meaning
        self.name = name
        self.sequenceNo = sequenceNo
        self.updatedBy = updatedBy
        self.updatedOn = updatedOn
    }
    
    let about: String?
    let appLanguage: String?
    let arabic: String?
    let contentBaseUrl: String?
    let contentUrl: String?
    let createdBy: String?
    let createdOn: String?
    let fazilat: String?
    let id: String?
    let imageUrl: String?
    let isActive: Bool?
    let meaning: String?
    let name: String?
    let sequenceNo: Int?
    let updatedBy: String?
    let updatedOn: String?
}
