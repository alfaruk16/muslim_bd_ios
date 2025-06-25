//
//  CategoryState.swift
//  muslimbd
//
//  Created by Al Faruk on 12/1/25.
//

struct IslamicNamesState {
    internal init(isLoading: Bool = true, male: IslamicNamesDto = IslamicNamesDto(), female: IslamicNamesDto = IslamicNamesDto(), selectedTab: Int = 0) {
        self.isLoading = isLoading
        self.male = male
        self.female = female
        self.selectedTab = selectedTab
    }
    
    let isLoading: Bool
    let male: IslamicNamesDto
    let female: IslamicNamesDto
    let selectedTab: Int
}

extension IslamicNamesState {
    func copy(isLoading: Bool? = nil, male: IslamicNamesDto? = nil, female: IslamicNamesDto? = nil, selectedTab: Int? = nil
    ) -> IslamicNamesState {
        return IslamicNamesState(
            isLoading: isLoading ?? self.isLoading,
            male: male ?? self.male,
            female: female ?? self.female,
            selectedTab: selectedTab ?? self.selectedTab
        )
    }
}


