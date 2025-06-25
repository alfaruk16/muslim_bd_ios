//
//  AllParaDtoItem.swift
//  muslimbd
//
//  Created by Al Faruk on 31/12/24.
//

struct AllParaDtoItem : Codable {
    internal init(about: String? = nil, appLanguage: String? = nil, createdBy: String? = nil, createdOn: String? = nil, id: String? = nil, isActive: Bool? = nil, name: String? = nil, sequenceNo: Int? = nil, surahMapping: String? = nil, updatedBy: String? = nil, updatedOn: String? = nil) {
        self.about = about
        self.appLanguage = appLanguage
        self.createdBy = createdBy
        self.createdOn = createdOn
        self.id = id
        self.isActive = isActive
        self.name = name
        self.sequenceNo = sequenceNo
        self.surahMapping = surahMapping
        self.updatedBy = updatedBy
        self.updatedOn = updatedOn
    }
    
    let about: String?
    let appLanguage: String?
    let createdBy: String?
    let createdOn: String?
    let id: String?
    let isActive: Bool?
    let name: String?
    let sequenceNo: Int?
    let surahMapping: String?
    let updatedBy: String?
    let updatedOn: String?
}
