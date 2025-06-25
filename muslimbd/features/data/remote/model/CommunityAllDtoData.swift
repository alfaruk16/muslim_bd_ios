//
//  CommunityAllDtoData.swift
//  muslimbd
//
//  Created by Al Faruk on 31/12/24.
//

import Foundation

struct CommunityAllDtoData : Codable {
    internal init(about: String? = nil, answer: String? = nil, appLanguage: String? = nil, appTypes: String? = nil, contentBaseUrl: String? = nil, createdBy: String? = nil, createdOn: String? = nil, id: String? = nil, isActive: Bool? = nil, question: String? = nil, scholarId: String? = nil, scholarImage: String? = nil, scholarName: String? = nil, sequenceNo: Int? = nil, updatedBy: String? = nil, updatedOn: String? = nil, userName: String? = nil) {
        self.about = about
        self.answer = answer
        self.appLanguage = appLanguage
        self.appTypes = appTypes
        self.contentBaseUrl = contentBaseUrl
        self.createdBy = createdBy
        self.createdOn = createdOn
        self.id = id
        self.isActive = isActive
        self.question = question
        self.scholarId = scholarId
        self.scholarImage = scholarImage
        self.scholarName = scholarName
        self.sequenceNo = sequenceNo
        self.updatedBy = updatedBy
        self.updatedOn = updatedOn
        self.userName = userName
    }
    
    let about: String?
    let answer: String?
    let appLanguage: String?
    let appTypes: String?
    let contentBaseUrl: String?
    let createdBy: String?
    let createdOn: String?
    let id: String?
    let isActive: Bool?
    let question: String?
    let scholarId: String?
    let scholarImage: String?
    let scholarName: String?
    let sequenceNo: Int?
    let updatedBy: String?
    let updatedOn: String?
    let userName: String?
}
