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

class CategoryViewModel: ObservableObject {
    @Injected private var getCategoryContentsUseCase: GetCategoryContentsUseCase
    @Injected private var getImageContentsUseCase: GetImageContentsUseCase
    @Injected private var getSubCategoryContentsUseCase: GetSubCategoryContentsUseCase
    @Injected private var getImageContentsBySubCategoryUseCase: GetImageContentsBySubCategoryUseCase
    
    private var cancelables = [AnyCancellable]()

    @Published var state: CategoryState = CategoryState()
    
    func initiate(category: CategoryDtoItem) {
        
        if(category.hasSubCategory ?? false){
            if(category.category == AppConstants.wallPaperId){
                getSubCategoryImageContents(id: category.id ?? "")
            }else{
                getSubCategoryContents(id: category.id ?? "")
            }
        } else if (category.id == AppConstants.imageCategoryId || category.id == AppConstants.panchaStomvoId){
            getImageContents(id: category.id ?? "")
        }else if (category.selectedTab == nil){
            getSubCategories(id: category.id ?? "")
        }
        
        if(category.selectedTab != nil){
            state = state.copy(selectedTab: category.selectedTab ?? 0)
            if(category.selectedTab == 0){
                getMalePrayerLearning()
            }else{
                getFemalePrayerLearning()
            }
        }
    }
    
    private func getSubCategoryContents(id: String){
        getSubCategoryContentsUseCase.invoke(id: id).receive(on: DispatchQueue.main)
            .sink(receiveCompletion: { _ in }, receiveValue: { [weak self] response in
                self?.state = self?.state.copy(categoryContents: response) ?? CategoryState()
            }).store(in: &cancelables)
    }
    
    private func getSubCategoryImageContents(id: String){
        getImageContentsBySubCategoryUseCase.invoke(id: id).receive(on: DispatchQueue.main)
            .sink(receiveCompletion: { _ in }, receiveValue: { [weak self] response in
                self?.state = self?.state.copy(imageContents: response) ?? CategoryState()
            }).store(in: &cancelables)
    }
    
    private func getImageContents(id: String){
        getImageContentsUseCase.invoke(id: id).receive(on: DispatchQueue.main)
            .sink(receiveCompletion: { _ in }, receiveValue: { [weak self] response in
                self?.state = self?.state.copy(imageContents: response) ?? CategoryState()
            }).store(in: &cancelables)
    }
    
    private func getSubCategories(id: String){
        getCategoryContentsUseCase.invoke(id: id).receive(on: DispatchQueue.main)
            .sink(receiveCompletion: { _ in }, receiveValue: { [weak self] response in
                self?.state = self?.state.copy(categoryContents: response) ?? CategoryState()
            }).store(in: &cancelables)
    }
    
    private func getMalePrayerLearning(){
        getCategoryContentsUseCase.invoke(id: AppConstants.malePrayerId).receive(on: DispatchQueue.main)
            .sink(receiveCompletion: { _ in }, receiveValue: { [weak self] response in
                self?.state = self?.state.copy(malePrayer: response) ?? CategoryState()
            }).store(in: &cancelables)
    }
    
    private func getFemalePrayerLearning(){
        getCategoryContentsUseCase.invoke(id: AppConstants.femalePrayerId).receive(on: DispatchQueue.main)
            .sink(receiveCompletion: { _ in }, receiveValue: { [weak self] response in
                self?.state = self?.state.copy(femalePrayer: response) ?? CategoryState()
            }).store(in: &cancelables)
    }
    
    func tabChanged(index: Int){
        state = state.copy(selectedTab: index)
        if(index == 0 && state.malePrayer.data == nil){
            getMalePrayerLearning()
        }else if (state.femalePrayer.data == nil){
            getFemalePrayerLearning()
        }
    }
    
    func updateCurrentContent(content: TextContentDtoItem){
        state = state.copy(currentContent: state.currentContent.id != nil ? TextContentDtoItem() : content)
    }
}
