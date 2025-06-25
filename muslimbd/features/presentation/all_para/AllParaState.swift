//
//  CategoryState.swift
//  muslimbd
//
//  Created by Al Faruk on 12/1/25.
//

struct AllParaState {
    internal init(isLoading: Bool = false, alQuran: AllParaDto = AllParaDto()) {
        self.isLoading = isLoading
        self.alQuran = alQuran
    }
    
    let isLoading: Bool
    let alQuran: AllParaDto
}

extension AllParaState {
    func copy(isLoading: Bool? = nil, alQuran: AllParaDto? = nil) -> AllParaState {
        return AllParaState(
            isLoading: isLoading ?? self.isLoading,
            alQuran: alQuran ?? self.alQuran
        )
    }
}


