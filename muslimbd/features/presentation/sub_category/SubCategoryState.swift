//
//  CategoryState.swift
//  muslimbd
//
//  Created by Al Faruk on 12/1/25.
//

struct SubCategoryState {
    internal init(isLoading: Bool = false, subCategories: CategoryDto = CategoryDto()) {
        self.isLoading = isLoading
        self.subCategories = subCategories
    }
    
    let isLoading: Bool
    let subCategories: CategoryDto
}

extension SubCategoryState {
    func copy(isLoading: Bool? = nil, subCategories: CategoryDto? = nil) -> SubCategoryState {
        return SubCategoryState(
            isLoading: isLoading ?? self.isLoading,
            subCategories: subCategories ?? self.subCategories
        )
    }
}


