//
//  HomeState.swift
//  muslimbd
//
//  Created by Al Faruk on 8/1/25.
//

import Foundation
import Combine

struct ArtistAudioVideoState {
    internal init(isLoading: Bool = true, tracks: TracksDto = TracksDto(), videoTracks: TracksDto = TracksDto(), currentArtistId: String = "", currentArtist: ArtistDtoItem = ArtistDtoItem(), artistList: ArtistDto = ArtistDto(), currentTrack: TracksDtoItem = TracksDtoItem(), showCount: Int = 5, showCountVideo: Int = 5, selectedTab: Int = 0) {
        self.isLoading = isLoading
        self.tracks = tracks
        self.videoTracks = videoTracks
        self.currentArtistId = currentArtistId
        self.currentArtist = currentArtist
        self.artistList = artistList
        self.currentTrack = currentTrack
        self.showCount = showCount
        self.showCountVideo = showCountVideo
        self.selectedTab = selectedTab
    }
    
    let isLoading: Bool
    let tracks: TracksDto
    let videoTracks: TracksDto
    let currentArtistId: String
    let currentArtist: ArtistDtoItem
    let artistList: ArtistDto
    let currentTrack: TracksDtoItem
    let showCount: Int
    let showCountVideo: Int
    let selectedTab: Int
}

extension ArtistAudioVideoState{
    func copy(
            isLoading: Bool? = nil,
            tracks: TracksDto? = nil,
            videoTracks: TracksDto? = nil,
            currentArtistId: String? = nil,
            currentArtist: ArtistDtoItem? = nil,
            artistList: ArtistDto? = nil,
            currentTrack: TracksDtoItem? = nil,
            showCount: Int? = nil,
            showCountVideo: Int? = nil,
            selectedTab: Int? = nil
        ) -> ArtistAudioVideoState {
            return ArtistAudioVideoState(
                isLoading: isLoading ?? self.isLoading,
                tracks: tracks ?? self.tracks,
                videoTracks: videoTracks ?? self.videoTracks,
                currentArtistId: currentArtistId ?? self.currentArtistId,
                currentArtist: currentArtist ?? self.currentArtist,
                artistList: artistList ?? self.artistList,
                currentTrack: currentTrack ?? self.currentTrack,
                showCount: showCount ?? self.showCount,
                showCountVideo: showCountVideo ?? self.showCountVideo,
                selectedTab: selectedTab ?? self.selectedTab
            )
        }
}
