//
//  CategoryState.swift
//  muslimbd
//
//  Created by Al Faruk on 12/1/25.
//

struct AlQuranState {
    internal init(isLoading: Bool = false, alQuran: AlQuranDto = AlQuranDto()) {
        self.isLoading = isLoading
        self.alQuran = alQuran
    }
    
    let isLoading: Bool
    let alQuran: AlQuranDto
}

extension AlQuranState {
    func copy(isLoading: Bool? = nil, alQuran: AlQuranDto? = nil) -> AlQuranState {
        return AlQuranState(
            isLoading: isLoading ?? self.isLoading,
            alQuran: alQuran ?? self.alQuran
        )
    }
}


