//
//  VideoContentsDtoData.swift
//  muslimbd
//
//  Created by Al Faruk on 31/12/24.
//

import Foundation

struct VideoContentsDtoData : Codable {
    internal init(about: String? = nil, age: String? = nil, appLanguage: String? = nil, bannerURL: String? = nil, category: String? = nil, categoryName: String? = nil, composer: String? = nil, contenTtitle: String? = nil, contentBaseUrl: String? = nil, createdBy: String? = nil, createdOn: String? = nil, description: String? = nil, director: String? = nil, duration: String? = nil, ep: String? = nil, epNumber: String? = nil, filePath: String? = nil, filePathAudio: String? = nil, genreAs: String? = nil, genreCode: String? = nil, id: String? = nil, isActive: Bool? = nil, isLove: String? = nil, isWish: String? = nil, labelCode: String? = nil, lyricist: String? = nil, playPercent: Int? = nil, previewURL: String? = nil, publishingDate: String? = nil, publishingYear: String? = nil, rating: String? = nil, sequenceNo: Int? = nil, singer: String? = nil, starring: String? = nil, subTitle: String? = nil, subcategory: String? = nil, subcategoryName: String? = nil, type: String? = nil, updatedBy: String? = nil, updatedOn: String? = nil, viewCount: Int? = nil) {
        self.about = about
        self.age = age
        self.appLanguage = appLanguage
        self.bannerURL = bannerURL
        self.category = category
        self.categoryName = categoryName
        self.composer = composer
        self.contenTtitle = contenTtitle
        self.contentBaseUrl = contentBaseUrl
        self.createdBy = createdBy
        self.createdOn = createdOn
        self.description = description
        self.director = director
        self.duration = duration
        self.ep = ep
        self.epNumber = epNumber
        self.filePath = filePath
        self.filePathAudio = filePathAudio
        self.genreAs = genreAs
        self.genreCode = genreCode
        self.id = id
        self.isActive = isActive
        self.isLove = isLove
        self.isWish = isWish
        self.labelCode = labelCode
        self.lyricist = lyricist
        self.playPercent = playPercent
        self.previewURL = previewURL
        self.publishingDate = publishingDate
        self.publishingYear = publishingYear
        self.rating = rating
        self.sequenceNo = sequenceNo
        self.singer = singer
        self.starring = starring
        self.subTitle = subTitle
        self.subcategory = subcategory
        self.subcategoryName = subcategoryName
        self.type = type
        self.updatedBy = updatedBy
        self.updatedOn = updatedOn
        self.viewCount = viewCount
    }
    
    let about: String?
    let age: String?
    let appLanguage: String?
    let bannerURL: String?
    let category: String?
    let categoryName: String?
    let composer: String?
    let contenTtitle: String?
    let contentBaseUrl: String?
    let createdBy: String?
    let createdOn: String?
    let description: String?
    let director: String?
    let duration: String?
    let ep: String?
    let epNumber: String?
    let filePath: String?
    let filePathAudio: String?
    let genreAs: String?
    let genreCode: String?
    let id: String?
    let isActive: Bool?
    let isLove: String?
    let isWish: String?
    let labelCode: String?
    let lyricist: String?
    let playPercent: Int?
    let previewURL: String?
    let publishingDate: String?
    let publishingYear: String?
    let rating: String?
    let sequenceNo: Int?
    let singer: String?
    let starring: String?
    let subTitle: String?
    let subcategory: String?
    let subcategoryName: String?
    let type: String?
    let updatedBy: String?
    let updatedOn: String?
    let viewCount: Int?
}
