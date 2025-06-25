//
//  AlbumTrackDtoItem.swift
//  muslimbd
//
//  Created by Al Faruk on 31/12/24.
//

struct AlbumTrackDtoItem : Codable {
    internal init(about: String? = nil, albumId: String? = nil, albumName: String? = nil, appLanguage: String? = nil, artistAppearsAs: String? = nil, artistId: String? = nil, artistName: String? = nil, category: String? = nil, categoryName: String? = nil, contentBaseUrl: String? = nil, contentCategory: String? = nil, createdBy: String? = nil, createdOn: String? = nil, duration: String? = nil, genreId: String? = nil, id: String? = nil, imageUrl: String? = nil, isActive: Bool? = nil, isPublish: Bool? = nil, lyrics: String? = nil, sequenceNo: Int? = nil, streamUrl: String? = nil, subcategory: String? = nil, subcategoryName: String? = nil, trackAlbum: String? = nil, trackId: String? = nil, trackName: String? = nil, updatedBy: String? = nil, updatedOn: String? = nil, playCount: Int? = nil) {
        self.about = about
        self.albumId = albumId
        self.albumName = albumName
        self.appLanguage = appLanguage
        self.artistAppearsAs = artistAppearsAs
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
        self.isPublish = isPublish
        self.lyrics = lyrics
        self.sequenceNo = sequenceNo
        self.streamUrl = streamUrl
        self.subcategory = subcategory
        self.subcategoryName = subcategoryName
        self.trackAlbum = trackAlbum
        self.trackId = trackId
        self.trackName = trackName
        self.updatedBy = updatedBy
        self.updatedOn = updatedOn
        self.playCount = playCount
    }
    
    let about: String?
    let albumId: String?
    let albumName: String?
    let appLanguage: String?
    let artistAppearsAs: String?
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
    let isPublish: Bool?
    let lyrics: String?
    let sequenceNo: Int?
    let streamUrl: String?
    let subcategory: String?
    let subcategoryName: String?
    let trackAlbum: String?
    let trackId: String?
    let trackName: String?
    let updatedBy: String?
    let updatedOn: String?
    let playCount: Int?
}

extension AlbumTrackDtoItem {
    func toTrackDtoItem() -> TracksDtoItem {
        return TracksDtoItem(
            about: about,
            appLanguage: appLanguage,
            artistId: artistId,
            artistName: artistName,
            category: category,
            categoryName: categoryName,
            contentBaseUrl: contentBaseUrl,
            contentCategory: contentCategory,
            createdBy: createdBy,
            createdOn: createdOn,
            duration: duration,
            genreId: genreId,
            id: trackId, // Use trackId from AlbumTrackDtoItem
            imageUrl: imageUrl,
            isActive: isActive,
            lyrics: lyrics,
            sequenceNo: sequenceNo,
            streamUrl: streamUrl,
            subcategory: subcategory,
            subcategoryName: subcategoryName,
            title: trackName, // Use trackName from AlbumTrackDtoItem
            updatedBy: updatedBy,
            updatedOn: updatedOn,
            playCount: playCount,
            albumId: albumId
        )
    }
}
