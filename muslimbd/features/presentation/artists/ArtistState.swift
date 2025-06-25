//
//  HomeState.swift
//  muslimbd
//
//  Created by Al Faruk on 8/1/25.
//

import Foundation
import Combine

struct ArtistState {
    internal init(isLoading: Bool = true, artist: ArtistDto = ArtistDto()) {
        self.isLoading = isLoading
        self.artist = artist
    }
    
    let isLoading: Bool
    let artist: ArtistDto
}

extension ArtistState{
    func copy(
        isLoading: Bool? = nil,
        artist: ArtistDto? = nil
    ) -> ArtistState {
        return ArtistState(
            isLoading: isLoading ?? self.isLoading,
            artist: artist ?? self.artist
        )
    }
}
