//
//  Ayaat.swift
//  muslimbd
//
//  Created by Al Faruk on 20/1/25.
//

import SwiftUI

struct Ayaat: View {
    let ayaat: SurahDtoItem
    let surah: AlQuranDtoItem
    
    var body: some View {
        VStack{
            Text(ayaat.textInArabic ?? "").foregroundColor(Color.gray).fontWeight(.medium)
            Spacer().frame(height: 5)
            Text(ayaat.text ?? "").foregroundColor(Color.primary)
            Divider()
            HStack{
                Text(String(ayaat.sequenceNo ?? 0) + " : \(String(surah.totalAyat ?? 0))").font(.system(size: 12))
                Spacer()
                
            }
        }.frame(maxWidth: .infinity).padding(10).background(Color.backgroundDark).cornerRadius(10)
    }
}


#Preview {
    Ayaat(ayaat: SurahDtoItem(sequenceNo: 1, surahId: "id", text: "Text", textInArabic: "Arabic"), surah: AlQuranDtoItem(sequenceNo: 1, totalAyat: 7))
}
