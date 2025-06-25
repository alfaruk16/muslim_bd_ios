//
//  ImageContentDtoItem.swift
//  muslimbd
//
//  Created by Al Faruk on 31/12/24.
//

import Foundation

struct ImageContentDtoItem : Codable {
    internal init(about: String? = nil, appLanguage: String? = nil, category: String? = nil, categoryName: String? = nil, contentBaseUrl: String? = nil, createdBy: String? = nil, createdOn: String? = nil, id: String? = nil, imageUrl: String? = nil, isActive: Bool? = nil, refUrl: String? = nil, sequenceNo: Int? = nil, subcategory: String? = nil, subcategoryName: String? = nil, title: String? = nil, updatedBy: String? = nil, updatedOn: String? = nil) {
        self.about = about
        self.appLanguage = appLanguage
        self.category = category
        self.categoryName = categoryName
        self.contentBaseUrl = contentBaseUrl
        self.createdBy = createdBy
        self.createdOn = createdOn
        self.id = id
        self.imageUrl = imageUrl
        self.isActive = isActive
        self.refUrl = refUrl
        self.sequenceNo = sequenceNo
        self.subcategory = subcategory
        self.subcategoryName = subcategoryName
        self.title = title
        self.updatedBy = updatedBy
        self.updatedOn = updatedOn
    }
    
    let about: String?
    let appLanguage: String?
    let category: String?
    let categoryName: String?
    let contentBaseUrl: String?
    let createdBy: String?
    let createdOn: String?
    let id: String?
    let imageUrl: String?
    let isActive: Bool?
    let refUrl: String?
    let sequenceNo: Int?
    let subcategory: String?
    let subcategoryName: String?
    let title: String?
    let updatedBy: String?
    let updatedOn: String?
}

extension ImageContentDtoItem {
    func toTextContentDtoItem() -> TextContentDtoItem {
        return TextContentDtoItem(about: about, appLanguage: appLanguage, category: category, categoryName: categoryName, contentBaseUrl: contentBaseUrl, createdBy: createdBy, createdOn: createdOn, id: id, imageUrl: imageUrl, isActive: isActive, refUrl: refUrl, sequenceNo: sequenceNo, subcategory: subcategory, subcategoryName: subcategoryName, title: title, updatedBy: updatedBy, updatedOn: updatedOn)
    }
}
