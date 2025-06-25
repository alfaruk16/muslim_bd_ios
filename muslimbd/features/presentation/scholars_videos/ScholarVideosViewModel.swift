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

class ScholarVideosViewModel: ObservableObject {
    @Injected private var getScholarTrackByArtistUseCase: GetScholarTrackByArtistUseCase
    @Injected private var getScholarUseCase: GetScholarUseCase
    @Injected private var getScholarByIdUseCase: GetScholarByIdUseCase
    
    private var cancelables = [AnyCancellable]()
    
    @Published var state: ScholarVideosState = ScholarVideosState()
    
    init(cancelables: [AnyCancellable] = [AnyCancellable]()) {
        self.cancelables = cancelables
    }
    
    func initiate(artist: ArtistDtoItem){
        state = state.copy(currentArtistId: artist.id  ?? "", currentArtist: artist)
        if(artist.contentBaseUrl != nil){
            getScholar(id: artist.id ?? "")
        }
        getTracksByArtist(id: artist.id ?? "")
        getArtist()
    }
    
    func getArtist(){
        getScholarUseCase.invoke().receive(on: DispatchQueue.main)
            .sink(receiveCompletion: { _ in }, receiveValue: { [weak self] response in
                self?.state = self?.state.copy(isLoading: false, artistList: response) ?? ScholarVideosState()
            })
            .store(in: &cancelables)
    }
    
    func getTracksByArtist(id: String){
        getScholarTrackByArtistUseCase.invoke(artistId: id, type: AppConstants.typeVideo).receive(on: DispatchQueue.main)
            .sink(receiveCompletion: { _ in }, receiveValue: { [weak self] response in
                self?.state = self?.state.copy(isLoading: false, tracks: response) ?? ScholarVideosState()
            })
            .store(in: &cancelables)
    }
    
    func getScholar(id: String){
        getScholarByIdUseCase.invoke(id: id).receive(on: DispatchQueue.main)
            .sink(receiveCompletion: { _ in }, receiveValue: { [weak self] response in
                self?.state = self?.state.copy(isLoading: false, currentArtist: response.data?.toArtistDtoItem()) ?? ScholarVideosState()
            })
            .store(in: &cancelables)
    }
    
    
    func videoSelected(track: TracksDtoItem){
        state = state.copy(currentTrack: track)
    }
    
    func showMore(){
        if (state.showCount >= (state.tracks.data?.count ?? 0)) {
            state = state.copy(showCount : 5)
        } else {
            state = state.copy(showCount : state.showCount + 5)
        }
    }
    
    func artistSelected(artist: ArtistDtoItem){
        state = state.copy(currentArtistId: artist.id ?? "", currentArtist: artist)
        getTracksByArtist(id: artist.id ?? "")
    }
}

