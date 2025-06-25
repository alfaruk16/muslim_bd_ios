//
//  CategoryState.swift
//  muslimbd
//
//  Created by Al Faruk on 12/1/25.
//

struct AllahNamesDetailsState {
    internal init(isLoading: Bool = false, allahNames: AllahNamesDto = AllahNamesDto(), allahName: AllahNamesDtoItem = AllahNamesDtoItem()) {
        self.isLoading = isLoading
        self.allahNames = allahNames
        self.allahName = allahName
    }
    
    let isLoading: Bool
    let allahNames: AllahNamesDto
    let allahName: AllahNamesDtoItem
}

extension AllahNamesDetailsState {
    func copy(isLoading: Bool? = nil, allahNames: AllahNamesDto? = nil, allahName: AllahNamesDtoItem? = nil) -> AllahNamesDetailsState {
        return AllahNamesDetailsState(
            isLoading: isLoading ?? self.isLoading,
            allahNames: allahNames ?? self.allahNames,
            allahName: allahName ?? self.allahName
        )
    }
}


