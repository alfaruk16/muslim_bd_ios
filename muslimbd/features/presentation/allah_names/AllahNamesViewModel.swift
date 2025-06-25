//
//  CategoryViewModel.swift
//  muslimbd
//
//  Created by Al Faruk on 12/1/25.
//

import Foundation
import Combine
import Resolver
import UIKit

class AllahNamesViewModel: ObservableObject {
    @Injected private var getAllahNamesUseCase: GetAllahNamesUseCase
    
    
    private var cancelables = [AnyCancellable]()

    @Published var state: AllahNamesState = AllahNamesState()
    
    func initiate(category: CategoryDtoItem) {
        getAllahNames()
    }
    
    private func getAllahNames(){
        getAllahNamesUseCase.invoke().receive(on: DispatchQueue.main)
            .sink(receiveCompletion: { _ in }, receiveValue: { [weak self] response in
                self?.state = self?.state.copy(isLoading: false, allahNames: response) ?? AllahNamesState()
            }).store(in: &cancelables)
    }
}
