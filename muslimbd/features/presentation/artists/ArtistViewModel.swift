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

class ArtistViewModel: ObservableObject {
    @Injected private var getArtistUseCase: GetArtistUseCase
    
    private var cancelables = [AnyCancellable]()
    
    @Published var state: ArtistState = ArtistState()
    
    init(cancelables: [AnyCancellable] = [AnyCancellable]()) {
        self.cancelables = cancelables
        
        getArtist()
    }
    
    func getArtist(){
        getArtistUseCase.invoke().receive(on: DispatchQueue.main)
            .sink(receiveCompletion: { _ in }, receiveValue: { [weak self] response in
                self?.state = self?.state.copy(artist: response) ?? ArtistState()
            })
            .store(in: &cancelables)
    }
    
}

