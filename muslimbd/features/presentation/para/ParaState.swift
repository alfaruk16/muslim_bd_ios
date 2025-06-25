//
//  CategoryState.swift
//  muslimbd
//
//  Created by Al Faruk on 12/1/25.
//

struct ParaState {
    internal init(isLoading: Bool = false, alQuran: AllParaDto = AllParaDto(), surah: ParaDto = ParaDto()) {
        self.isLoading = isLoading
        self.alQuran = alQuran
        self.surah = surah
    }
    
    let isLoading: Bool
    let alQuran: AllParaDto
    let surah: ParaDto
}

extension ParaState {
    func copy(isLoading: Bool? = nil, alQuran: AllParaDto? = nil, surah: ParaDto? = nil) -> ParaState {
        return ParaState(
            isLoading: isLoading ?? self.isLoading,
            alQuran: alQuran ?? self.alQuran,
            surah: surah ?? self.surah
        )
    }
}


