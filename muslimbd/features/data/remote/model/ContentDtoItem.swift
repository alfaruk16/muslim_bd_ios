//
//  ContentDtoItem.swift
//  muslimbd
//
//  Created by Al Faruk on 31/12/24.
//

import Foundation

struct ContentDtoItem : Codable {
    internal init(albumId: String? = nil, albumName: String? = nil, artistId: String? = nil, artistName: String? = nil, category: String? = nil, categoryName: String? = nil, contentCategory: String? = nil, contentId: String? = nil, contentName: String? = nil, contentOrder: Int? = nil, contentType: String? = nil, contentUrl: String? = nil, copyright: String? = nil, imageUrl: String? = nil, labelName: String? = nil, subcategory: String? = nil, subcategoryName: String? = nil, text: String? = nil, textInArabic: String? = nil) {
        self.albumId = albumId
        self.albumName = albumName
        self.artistId = artistId
        self.artistName = artistName
        self.category = category
        self.categoryName = categoryName
        self.contentCategory = contentCategory
        self.contentId = contentId
        self.contentName = contentName
        self.contentOrder = contentOrder
        self.contentType = contentType
        self.contentUrl = contentUrl
        self.copyright = copyright
        self.imageUrl = imageUrl
        self.labelName = labelName
        self.subcategory = subcategory
        self.subcategoryName = subcategoryName
        self.text = text
        self.textInArabic = textInArabic
    }
    
    let albumId: String?
    let albumName: String?
    let artistId: String?
    let artistName: String?
    let category: String?
    let categoryName: String?
    let contentCategory: String?
    let contentId: String?
    let contentName: String?
    let contentOrder: Int?
    let contentType: String?
    let contentUrl: String?
    let copyright: String?
    let imageUrl: String?
    let labelName: String?
    let subcategory: String?
    let subcategoryName: String?
    let text: String?
    let textInArabic: String?
}

extension ContentDtoItem {
    func copy(
        albumId: String? = nil,
        albumName: String? = nil,
        artistId: String? = nil,
        artistName: String? = nil,
        category: String? = nil,
        categoryName: String? = nil,
        contentCategory: String? = nil,
        contentId: String? = nil,
        contentName: String? = nil,
        contentOrder: Int? = nil,
        contentType: String? = nil,
        contentUrl: String? = nil,
        copyright: String? = nil,
        imageUrl: String? = nil,
        labelName: String? = nil,
        subcategory: String? = nil,
        subcategoryName: String? = nil,
        text: String? = nil,
        textInArabic: String? = nil
    ) -> ContentDtoItem {
        return ContentDtoItem(
            albumId: albumId ?? self.albumId,
            albumName: albumName ?? self.albumName,
            artistId: artistId ?? self.artistId,
            artistName: artistName ?? self.artistName,
            category: category ?? self.category,
            categoryName: categoryName ?? self.categoryName,
            contentCategory: contentCategory ?? self.contentCategory,
            contentId: contentId ?? self.contentId,
            contentName: contentName ?? self.contentName,
            contentOrder: contentOrder ?? self.contentOrder,
            contentType: contentType ?? self.contentType,
            contentUrl: contentUrl ?? self.contentUrl,
            copyright: copyright ?? self.copyright,
            imageUrl: imageUrl ?? self.imageUrl,
            labelName: labelName ?? self.labelName,
            subcategory: subcategory ?? self.subcategory,
            subcategoryName: subcategoryName ?? self.subcategoryName,
            text: text ?? self.text,
            textInArabic: textInArabic ?? self.textInArabic
        )
    }
}
