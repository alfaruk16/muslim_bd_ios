//
//  HomeState.swift
//  muslimbd
//
//  Created by Al Faruk on 8/1/25.
//

import Foundation
import Combine

struct AudioPlayerState {
    internal init(isLoading: Bool = false, track: TracksDtoItem = TracksDtoItem(), playingId: Int = -1, tracks: TracksDto = TracksDto(), artistList: ArtistDto = ArtistDto(), currentArtistId: String = "", showCount: Int = 5, favoriteLoading: Bool = false, isFavorite: Bool = false, downloadProgress: Int = 0, isDownloaded: Bool = false) {
        self.isLoading = isLoading
        self.track = track
        self.playingId = playingId
        self.tracks = tracks
        self.artistList = artistList
        self.currentArtistId = currentArtistId
        self.showCount = showCount
        self.favoriteLoading = favoriteLoading
        self.isFavorite = isFavorite
        self.downloadProgress = downloadProgress
        self.isDownloaded = isDownloaded
    }
    
    let isLoading: Bool
    let track: TracksDtoItem
    let playingId: Int
    let tracks: TracksDto
    let artistList: ArtistDto
    let currentArtistId: String
    let showCount: Int
    let favoriteLoading: Bool
    let isFavorite: Bool
    let downloadProgress: Int
    let isDownloaded: Bool
}

extension AudioPlayerState{
    func copy(
            isLoading: Bool? = nil,
            track: TracksDtoItem? = nil,
            playingId: Int? = nil,
            tracks: TracksDto? = nil,
            artistList: ArtistDto? = nil,
            currentArtistId: String? = nil,
            showCount: Int? = nil,
            favoriteLoading: Bool? = nil,
            isFavorite: Bool? = nil,
            downloadProgress: Int? = nil,
            isDownloaded: Bool? = nil
        ) -> AudioPlayerState {
            return AudioPlayerState(
                isLoading: isLoading ?? self.isLoading,
                track: track ?? self.track,
                playingId: playingId ?? self.playingId,
                tracks: tracks ?? self.tracks,
                artistList: artistList ?? self.artistList,
                currentArtistId: currentArtistId ?? self.currentArtistId,
                showCount: showCount ?? self.showCount,
                favoriteLoading: favoriteLoading ?? self.favoriteLoading,
                isFavorite: isFavorite ?? self.isFavorite,
                downloadProgress: downloadProgress ?? self.downloadProgress,
                isDownloaded: isDownloaded ?? self.isDownloaded
            )
        }
}
