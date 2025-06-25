//
//  HomeViewModel.swift
//  muslimbd
//
//  Created by Al Faruk on 24/11/24.
//

import Foundation
import Combine
import Resolver
import UIKit

class ArtistAudioVideoViewModel: ObservableObject {
    @Injected private var getTrackByArtistUseCase: GetTracksByArtistUseCase
    @Injected private var getArtistUseCase: GetArtistUseCase
    @Injected private var getArtistByIdUseCase: GetArtistById
    
    private var cancelables = [AnyCancellable]()
    
    @Published var state: ArtistAudioVideoState = ArtistAudioVideoState()
    
    init(cancelables: [AnyCancellable] = [AnyCancellable]()) {
        self.cancelables = cancelables
    }
    
    func initiate(artist: ArtistDtoItem){
        state = state.copy(currentArtistId: artist.id ?? "", currentArtist: artist)
        if(artist.contentBaseUrl == nil){
            getArtistById(id: artist.id ?? "")
        }
        getTrackByArtist(artistId: artist.id ?? "")
        getVideoTrackByArtist(artistId: artist.id ?? "")
        getArtist()
    }
    
    func getArtistById(id: String){
        getArtistByIdUseCase.invoke(id: id).receive(on: DispatchQueue.main)
            .sink(receiveCompletion: { _ in }, receiveValue: { [weak self] response in
                self?.state = self?.state.copy(isLoading: false, currentArtist: response.data) ?? ArtistAudioVideoState()
            })
            .store(in: &cancelables)
    }
    
    
    
    func getTrackByArtist(artistId: String){
        getTrackByArtistUseCase.invoke(artistId: artistId, type: AppConstants.typeAudio).receive(on: DispatchQueue.main)
            .sink(receiveCompletion: { _ in }, receiveValue: { [weak self] response in
                
                self?.state = self?.state.copy(isLoading: false, tracks: response) ?? ArtistAudioVideoState()
            })
            .store(in: &cancelables)
    }
    
    func getVideoTrackByArtist(artistId: String) {
        getTrackByArtistUseCase.invoke(artistId: artistId, type: AppConstants.typeVideo).receive(on: DispatchQueue.main)
            .sink(receiveCompletion: { _ in }, receiveValue: { [weak self] response in
                
                self?.state = self?.state.copy(isLoading: false, videoTracks: response) ?? ArtistAudioVideoState()
            })
            .store(in: &cancelables)
    }
    
    func getArtist(){
        getArtistUseCase.invoke().receive(on: DispatchQueue.main).sink(receiveCompletion: { _ in }, receiveValue: { [weak self] response in
            self?.state = self?.state.copy(isLoading: false, artistList: response) ?? ArtistAudioVideoState()
        }).store(in: &cancelables)
    }
    
    
    func videoSelected(track: TracksDtoItem){
        state = state.copy(currentTrack: track)
    }
    
    func showMore(){
        if (state.selectedTab == 0) {
            if (state.showCount >= (state.tracks.data?.count ?? 0)) {
                state = state.copy(showCount : 5)
            } else {
                state = state.copy(showCount : state.showCount + 5)
            }
        } else {
            if (state.showCountVideo >= (state.videoTracks.data?.count ?? 0)) {
                state = state.copy(showCountVideo : 5)
            } else {
                state = state.copy(showCountVideo : state.showCountVideo + 5)
            }
        }
    }
    
    func artistSelected(artist: ArtistDtoItem){
        state = state.copy(currentArtistId: artist.id ?? "", currentArtist: artist)
        getTrackByArtist(artistId: artist.id ?? "")
        getVideoTrackByArtist(artistId: artist.id ?? "")
    }
    
    func tabChanged(index: Int){
        state  = state.copy(selectedTab: index)
    }
}

