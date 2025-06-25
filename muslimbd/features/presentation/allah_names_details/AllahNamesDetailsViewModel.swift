//
//  CategoryViewModel.swift
//  muslimbd
//
//  Created by Al Faruk on 12/1/25.
//

import Foundation
import Combine
import Resolver

class AllahNamesDetailsViewModel: ObservableObject {
    @Injected private var getAllahNamesUseCase: GetAllahNamesUseCase
    
    
    private var cancelables = [AnyCancellable]()

    @Published var state: AllahNamesDetailsState = AllahNamesDetailsState()
    
    
    func initiate(category: CategoryDtoItem, name: AllahNamesDtoItem) {
        getAllahNames()
        state = state.copy(allahName: name)
    }
    
    private func getAllahNames(){
        getAllahNamesUseCase.invoke().receive(on: DispatchQueue.main)
            .sink(receiveCompletion: { _ in }, receiveValue: { [weak self] response in
                self?.state = self?.state.copy(isLoading: false, allahNames: response) ?? AllahNamesDetailsState()
            }).store(in: &cancelables)
    }
    
    func next(play: (String) -> Void){
        if(state.allahName.sequenceNo ?? 0 < 99 && state.allahNames.data != nil){
            state = state.copy(allahName: state.allahNames.data?[(state.allahName.sequenceNo ?? 0)])
            play((state.allahName.contentBaseUrl ?? "") + (state.allahName.contentUrl ?? ""))
        }
    }
    
    func prev(play: (String) -> Void){
        if(state.allahName.sequenceNo ?? 0 > 1 && state.allahNames.data != nil){
            state = state.copy(allahName: state.allahNames.data?[(state.allahName.sequenceNo ?? 0) - 2])
            play((state.allahName.contentBaseUrl ?? "") + (state.allahName.contentUrl ?? ""))
        }
    }
    
}
