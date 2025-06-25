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

class AudioPlayerViewModel: ObservableObject {
    @Injected private var getTracksByArtistUseCase: GetTracksByArtistUseCase
    @Injected private var getArtistUseCase: GetArtistUseCase
    @Injected private var getTrackByIdUseCase: GetTrackByIdUseCase
    @Injected private var setFavoriteUseCase: SetFavoriteUseCase
    @Injected private var checkIsFavoriteUseCase: CheckIsFavoriteUseCase
    @Injected private var cancelFavoriteUseCase: CancelFavoriteUseCase
    
    private var cancelables = [AnyCancellable]()
    
    @Published var state: AudioPlayerState = AudioPlayerState()
    
    init(cancelables: [AnyCancellable] = [AnyCancellable]()) {
        self.cancelables = cancelables
    }
    
    
    func initiate(track: TracksDtoItem){
        state = state.copy(track : track, currentArtistId : track.artistId ?? "")
        if(track.contentBaseUrl == nil || track.artistId == nil){
            getTrackById(id: track.id ?? "")
        }
        if(track.artistId != nil){
            getTracksByArtist(id: track.artistId ?? "")
        }
        getArtist()
    }
    
    func getTracksByArtist(id: String){
        getTracksByArtistUseCase.invoke(artistId: id, type: AppConstants.typeAudio).receive(on: DispatchQueue.main)
            .sink(receiveCompletion: { _ in }, receiveValue: { [weak self] response in
                
                self?.state = self?.state.copy(isLoading: false, tracks: response) ?? AudioPlayerState()
            })
            .store(in: &cancelables)
    }
    
    func getTrackById(id: String){
        getTrackByIdUseCase.invoke(id: id).receive(on: DispatchQueue.main)
            .sink(receiveCompletion: { _ in }, receiveValue: { [weak self] response in
                
                self?.state = self?.state.copy(isLoading: false, track: response.data) ?? AudioPlayerState()
            })
            .store(in: &cancelables)
    }
    
    
    func getArtist(){
        getArtistUseCase.invoke().receive(on: DispatchQueue.main)
            .sink(receiveCompletion: { _ in }, receiveValue: { [weak self] response in
                self?.state = self?.state.copy(artistList: response) ?? AudioPlayerState()
            })
            .store(in: &cancelables)
    }
    
}

