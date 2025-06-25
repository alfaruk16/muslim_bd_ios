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

class AudioArtistViewModel: ObservableObject {
    @Injected private var getTracksUseCase: GetTracksByTypeUseCase
    @Injected private var getTrackBilboardUseCase: GetTrackBillboardUseCase
    @Injected private var getArtistUseCase: GetArtistUseCase
    @Injected private var getAlbumUseCase: GetAlbumByTypeUseCase
    @Injected private var addPlayCountUseCase: AddPlayCountUseCase
    
    private var cancelables = [AnyCancellable]()
    
    @Published var state: AudioArtistState = AudioArtistState()
    
    init(cancelables: [AnyCancellable] = [AnyCancellable]()) {
        self.cancelables = cancelables
        
        getTrack(page: state.page, showCount: state.showCount)
        getArtist()
        getTrackBillboard()
        getAlbum()
    }
    
    func getTrack(page: Int, showCount: Int){
        getTracksUseCase.invoke(type: AppConstants.typeVideo, skip: page, take: state.take).receive(on: DispatchQueue.main)
            .sink(receiveCompletion: { _ in }, receiveValue: { [weak self] response in
                
                let all = (self?.state.tracks.data ?? []) + (response.data ?? [])
                
                self?.state = self?.state.copy(tracks: response.copy(data: all), showCount: showCount + 5, page: page) ?? AudioArtistState()
            })
            .store(in: &cancelables)
    }
    
    func getArtist(){
        getArtistUseCase.invoke().receive(on: DispatchQueue.main)
            .sink(receiveCompletion: { _ in }, receiveValue: { [weak self] response in
                self?.state = self?.state.copy(artist: response) ?? AudioArtistState()
            })
            .store(in: &cancelables)
    }
    
    func getTrackBillboard(){
        getTrackBilboardUseCase.invoke().receive(on: DispatchQueue.main)
            .sink(receiveCompletion: { _ in }, receiveValue: { [weak self] response in
                let list = response.data?.filter({$0.contentType == AppConstants.trackType && $0.contentCategory == AppConstants.typeAudio})
                self?.state = self?.state.copy(trackBillboard: response.copy(data: list)) ?? AudioArtistState()
            })
            .store(in: &cancelables)
    }
    
    func getAlbum(){
        getAlbumUseCase.invoke(type: AppConstants.typeVideo).receive(on: DispatchQueue.main)
            .sink(receiveCompletion: { _ in }, receiveValue: { [weak self] response in
                self?.state = self?.state.copy(albums: response) ?? AudioArtistState()
            })
            .store(in: &cancelables)
    }
    
    
    func showMore(){
        if (state.showCount == (state.tracks.data?.count ?? 0) && (state.tracks.data?.count ?? 0) < (state.tracks.totalRecords ?? 0)
        ) {
            getTrack(page: state.page + 1, showCount: state.showCount)
        } else if (state.showCount >= (state.tracks.totalRecords ?? 0)) {
            state = state.copy(showCount : 5)
        } else if (state.tracks.data?.count ?? 0 == state.page * state.take) {
            state = state.copy(showCount : state.showCount + 5)
        }
    }
}

