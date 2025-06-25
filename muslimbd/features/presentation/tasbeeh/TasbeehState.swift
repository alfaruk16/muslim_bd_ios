//
//  TasbeehState.swift
//  muslimbd
//
//  Created by Al Faruk on 19/1/25.
//

import Foundation

struct TasbeehState {
    internal init(totalCount: Int = 0, count: Int = 0, tasbeeh: Int = 33, selectedTasbeeh: String = Language.thirtyThreeTimes, selectedDhikr: Int = 1, dhikrs: [Dhikr]  = [
        Dhikr(
            id : 1,
            name : "যিকির ১",
            arabic : "سُبْحَانَ اللَّه",
            dhikr : "সুবহানাল্লাহ (Subhanallah)",
            meaning : "Meaning : Glory be to Allah"
        ),
        Dhikr(
            id : 2,
            name : "যিকির ২",
            arabic : "ٱلْحَمْدُ لِلَّٰهِ",
            dhikr : "আলহামদুলিল্লাহ (Alhamdulillah)",
            meaning : "Meaning : Praise be to Allah"
        ),
        Dhikr(
            id : 3,
            name : "যিকির ৩",
            arabic : "الله أكبر",
            dhikr : "আল্লাহু আকবার (Allahu Akbar)",
            meaning : "Meaning : Allah is greatest"
        ),
        Dhikr(
            id : 4,
            name : "যিকির ৪",
            arabic : "بسم الله",
            dhikr : "বিসমিল্লাহ (Bismillah)",
            meaning : "Meaning : In the name of Allah"
        ),
        Dhikr(
            id : 5,
            name : "যিকির ৫",
            arabic : "استغفرالله",
            dhikr : "আস্তাগফিরুল্লাহ (Astaghfirullah)",
            meaning : "Meaning : I seek forgiveness in Allah"
        ),
        Dhikr(
            id : 6,
            name : "যিকির ৬",
            arabic : "الله",
            dhikr : "আল্লাহ (Allah)",
            meaning : "Meaning : Allah is the Almighty"
        ),
        Dhikr(
            id : 7,
            name : "যিকির ৭",
            arabic : "لا اله الا الله",
            dhikr : "লা ইলাহা ইল্লাল্লাহ (La ilaha illallah)",
            meaning : "Meaning : There is none but Allah, truly worthy of worship except Allah"
        ),
        Dhikr(
            id : 8,
            name : "যিকির ৮",
            arabic : "لا حولة ولا كواتا إلا بالله",
            dhikr : "লা হাওলা ওয়ালা কুয়াতা ইল্লা বিল্লাহ (La hawla wala quwwata illa billah)",
            meaning : "Meaning : There is no power and no strength except with Allah"
        )
    ]) {
        self.totalCount = totalCount
        self.count = count
        self.tasbeeh = tasbeeh
        self.selectedTasbeeh = selectedTasbeeh
        self.selectedDhikr = selectedDhikr
        self.dhikrs = dhikrs
    }
    
    let totalCount: Int
    let count: Int
    let tasbeeh: Int
    let selectedTasbeeh: String
    let selectedDhikr: Int
    let dhikrs: [Dhikr]
}

extension TasbeehState {
    func copy(
        totalCount: Int? = nil,
        count: Int? = nil,
        tasbeeh: Int? = nil,
        selectedTasbeeh: String? = nil,
        selectedDhikr: Int? = nil,
        dhikrs: [Dhikr]? = nil
    ) -> TasbeehState {
        return TasbeehState(
            totalCount: totalCount ?? self.totalCount,
            count: count ?? self.count,
            tasbeeh: tasbeeh ?? self.tasbeeh,
            selectedTasbeeh: selectedTasbeeh ?? self.selectedTasbeeh,
            selectedDhikr: selectedDhikr ?? self.selectedDhikr,
            dhikrs: dhikrs ?? self.dhikrs
        )
    }
}
