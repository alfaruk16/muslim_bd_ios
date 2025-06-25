//
//  CategoryState.swift
//  muslimbd
//
//  Created by Al Faruk on 12/1/25.
//

struct AllahNamesState {
    internal init(isLoading: Bool = false, allahNames: AllahNamesDto = AllahNamesDto()) {
        self.isLoading = isLoading
        self.allahNames = allahNames
    }
    
    let isLoading: Bool
    let allahNames: AllahNamesDto
}

extension AllahNamesState {
    func copy(isLoading: Bool? = nil, allahNames: AllahNamesDto? = nil) -> AllahNamesState {
        return AllahNamesState(
            isLoading: isLoading ?? self.isLoading,
            allahNames: allahNames ?? self.allahNames
        )
    }
}


