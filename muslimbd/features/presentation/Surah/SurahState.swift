//
//  CategoryState.swift
//  muslimbd
//
//  Created by Al Faruk on 12/1/25.
//

struct SurahState {
    internal init(isLoading: Bool = false, alQuran: AlQuranDto = AlQuranDto(), surah: SurahDto = SurahDto(), surahItem: AlQuranDtoItem = AlQuranDtoItem()) {
        self.isLoading = isLoading
        self.alQuran = alQuran
        self.surah = surah
        self.surahItem = surahItem
    }
    
    let isLoading: Bool
    let alQuran: AlQuranDto
    let surah: SurahDto
    let surahItem: AlQuranDtoItem
}

extension SurahState {
    func copy(isLoading: Bool? = nil, alQuran: AlQuranDto? = nil, surah: SurahDto? = nil, surahItem: AlQuranDtoItem? = nil) -> SurahState {
        return SurahState(
            isLoading: isLoading ?? self.isLoading,
            alQuran: alQuran ?? self.alQuran,
            surah: surah ?? self.surah,
            surahItem: surahItem ?? self.surahItem
        )
    }
}


