//
//  HomeState.swift
//  muslimbd
//
//  Created by Al Faruk on 8/1/25.
//

import Foundation
import Combine

struct ScholarVideosState {
    internal init(isLoading: Bool = true, tracks: TracksDto = TracksDto(), currentArtistId: String = "", currentArtist: ArtistDtoItem = ArtistDtoItem(), artistList: ArtistDto = ArtistDto(), currentTrack: TracksDtoItem = TracksDtoItem(), showCount: Int = 5) {
        self.isLoading = isLoading
        self.tracks = tracks
        self.currentArtistId = currentArtistId
        self.currentArtist = currentArtist
        self.artistList = artistList
        self.currentTrack = currentTrack
        self.showCount = showCount
    }
    
    let isLoading: Bool
    let tracks: TracksDto
    let currentArtistId: String
    let currentArtist: ArtistDtoItem
    let artistList: ArtistDto
    let currentTrack: TracksDtoItem
    let showCount: Int
}

extension ScholarVideosState {
    func copy(
            isLoading: Bool? = nil,
            tracks: TracksDto? = nil,
            currentArtistId: String? = nil,
            currentArtist: ArtistDtoItem? = nil,
            artistList: ArtistDto? = nil,
            currentTrack: TracksDtoItem? = nil,
            showCount: Int? = nil
        ) -> ScholarVideosState {
            return ScholarVideosState(
                isLoading: isLoading ?? self.isLoading,
                tracks: tracks ?? self.tracks,
                currentArtistId: currentArtistId ?? self.currentArtistId,
                currentArtist: currentArtist ?? self.currentArtist,
                artistList: artistList ?? self.artistList,
                currentTrack: currentTrack ?? self.currentTrack,
                showCount: showCount ?? self.showCount
            )
        }
}
