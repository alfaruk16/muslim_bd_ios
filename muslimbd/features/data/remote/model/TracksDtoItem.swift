//
//  TracksDtoItem.swift
//  muslimbd
//
//  Created by Al Faruk on 31/12/24.
//

struct TracksDtoItem : Codable {
    internal init(about: String? = nil, appLanguage: String? = nil, artistId: String? = nil, artistName: String? = nil, category: String? = nil, categoryName: String? = nil, contentBaseUrl: String? = nil, contentCategory: String? = nil, createdBy: String? = nil, createdOn: String? = nil, duration: String? = nil, genreId: String? = nil, id: String? = nil, imageUrl: String? = nil, isActive: Bool? = nil, lyrics: String? = nil, sequenceNo: Int? = nil, streamUrl: String? = nil, subcategory: String? = nil, subcategoryName: String? = nil, title: String? = nil, updatedBy: String? = nil, updatedOn: String? = nil, playCount: Int? = nil, albumId: String? = nil) {
        self.about = about
        self.appLanguage = appLanguage
        self.artistId = artistId
        self.artistName = artistName
        self.category = category
        self.categoryName = categoryName
        self.contentBaseUrl = contentBaseUrl
        self.contentCategory = contentCategory
        self.createdBy = createdBy
        self.createdOn = createdOn
        self.duration = duration
        self.genreId = genreId
        self.id = id
        self.imageUrl = imageUrl
        self.isActive = isActive
        self.lyrics = lyrics
        self.sequenceNo = sequenceNo
        self.streamUrl = streamUrl
        self.subcategory = subcategory
        self.subcategoryName = subcategoryName
        self.title = title
        self.updatedBy = updatedBy
        self.updatedOn = updatedOn
        self.playCount = playCount
        self.albumId = albumId
    }
    
    let about: String?
    let appLanguage: String?
    let artistId: String?
    let artistName: String?
    let category: String?
    let categoryName: String?
    let contentBaseUrl: String?
    let contentCategory: String?
    let createdBy: String?
    let createdOn: String?
    let duration: String?
    let genreId: String?
    let id: String?
    let imageUrl: String?
    let isActive: Bool?
    let lyrics: String?
    let sequenceNo: Int?
    let streamUrl: String?
    let subcategory: String?
    let subcategoryName: String?
    let title: String?
    let updatedBy: String?
    let updatedOn: String?
    let playCount: Int?
    let albumId: String?
}
