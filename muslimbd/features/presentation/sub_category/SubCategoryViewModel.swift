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

class SubCategoryViewModel: ObservableObject {
    @Injected private var getSubCategoriesUseCase: GetSubCategoriesUseCase
    
    
    private var cancelables = [AnyCancellable]()

    @Published var state: SubCategoryState = SubCategoryState()
    
    func initiate(category: CategoryDtoItem) {
        getSubCategories(id: category.id ?? "")
    }
    
    private func getSubCategories(id: String){
        getSubCategoriesUseCase.invoke(id: id).receive(on: DispatchQueue.main)
            .sink(receiveCompletion: { _ in }, receiveValue: { [weak self] response in
                self?.state = self?.state.copy(isLoading: false, subCategories: response) ?? SubCategoryState()
            }).store(in: &cancelables)
    }
}
