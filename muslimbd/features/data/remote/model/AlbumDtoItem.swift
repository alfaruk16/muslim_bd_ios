//
//  AlbumDtoItem.swift
//  muslimbd
//
//  Created by Al Faruk on 31/12/24.
//

struct AlbumDtoItem : Codable {
    internal init(about: String? = nil, albumContents: String? = nil, appLanguage: String? = nil, artistAppearsAs: String? = nil, category: String? = nil, categoryName: String? = nil, contentBaseUrl: String? = nil, contentCategory: String? = nil, copyright: String? = nil, createdBy: String? = nil, createdOn: String? = nil, id: String? = nil, imageUrl: String? = nil, isActive: Bool? = nil, labelName: String? = nil, sequenceNo: Int? = nil, subcategory: String? = nil, subcategoryName: String? = nil, title: String? = nil, totalTrack: Int? = nil, updatedBy: String? = nil, updatedOn: String? = nil) {
        self.about = about
        self.albumContents = albumContents
        self.appLanguage = appLanguage
        self.artistAppearsAs = artistAppearsAs
        self.category = category
        self.categoryName = categoryName
        self.contentBaseUrl = contentBaseUrl
        self.contentCategory = contentCategory
        self.copyright = copyright
        self.createdBy = createdBy
        self.createdOn = createdOn
        self.id = id
        self.imageUrl = imageUrl
        self.isActive = isActive
        self.labelName = labelName
        self.sequenceNo = sequenceNo
        self.subcategory = subcategory
        self.subcategoryName = subcategoryName
        self.title = title
        self.totalTrack = totalTrack
        self.updatedBy = updatedBy
        self.updatedOn = updatedOn
    }
    
    let about: String?
    let albumContents: String?
    let appLanguage: String?
    let artistAppearsAs: String?
    let category: String?
    let categoryName: String?
    let contentBaseUrl: String?
    let contentCategory: String?
    let copyright: String?
    let createdBy: String?
    let createdOn: String?
    let id: String?
    let imageUrl: String?
    let isActive: Bool?
    let labelName: String?
    let sequenceNo: Int?
    let subcategory: String?
    let subcategoryName: String?
    let title: String?
    let totalTrack: Int?
    let updatedBy: String?
    let updatedOn: String?
}
