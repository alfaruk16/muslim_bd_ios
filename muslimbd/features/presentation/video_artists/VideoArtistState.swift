//
//  HomeState.swift
//  muslimbd
//
//  Created by Al Faruk on 8/1/25.
//

import Foundation
import Combine

struct VideoArtistState {
    internal init(isLoading: Bool = true, artist: ArtistDto = ArtistDto(), tracks: TracksDto = TracksDto(), artistTracks: TracksDto = TracksDto(), trackBillboard: TrackBillboardDto = TrackBillboardDto(), showCount: Int = 0, page: Int = 1, take: Int = 50, showCountArtist: Int = 5, currentTrack: TracksDtoItem = TracksDtoItem(), albums: AlbumDto = AlbumDto()) {
        self.isLoading = isLoading
        self.artist = artist
        self.tracks = tracks
        self.artistTracks = artistTracks
        self.trackBillboard = trackBillboard
        self.showCount = showCount
        self.page = page
        self.take = take
        self.showCountArtist = showCountArtist
        self.currentTrack = currentTrack
        self.albums = albums
    }
    
    let isLoading: Bool
    let artist: ArtistDto
    let tracks: TracksDto
    let artistTracks: TracksDto
    let trackBillboard: TrackBillboardDto
    let showCount: Int
    let page: Int
    let take: Int
    let showCountArtist: Int
    let currentTrack: TracksDtoItem
    let albums: AlbumDto
}

extension VideoArtistState{
    func copy(
            isLoading: Bool? = nil,
            artist: ArtistDto? = nil,
            tracks: TracksDto? = nil,
            artistTracks: TracksDto? = nil,
            trackBillboard: TrackBillboardDto? = nil,
            showCount: Int? = nil,
            page: Int? = nil,
            take: Int? = nil,
            showCountArtist: Int? = nil,
            currentTrack: TracksDtoItem? = nil,
            albums: AlbumDto? = nil
        ) -> VideoArtistState {
            return VideoArtistState(
                isLoading: isLoading ?? self.isLoading,
                artist: artist ?? self.artist,
                tracks: tracks ?? self.tracks,
                artistTracks: artistTracks ?? self.artistTracks,
                trackBillboard: trackBillboard ?? self.trackBillboard,
                showCount: showCount ?? self.showCount,
                page: page ?? self.page,
                take: take ?? self.take,
                showCountArtist: showCountArtist ?? self.showCountArtist,
                currentTrack: currentTrack ?? self.currentTrack,
                albums: albums ?? self.albums
            )
        }
}
