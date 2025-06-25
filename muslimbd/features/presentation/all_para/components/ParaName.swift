//
//  ParaName.swift
//  muslimbd
//
//  Created by Al Faruk on 27/1/25.
//

import SwiftUI

struct ParaName: View {
    let surah: AllParaDtoItem
    
    var body: some View {
        HStack{
            ZStack{
                Image(.allahNameSequence).resizable().frame(width: 36, height: 36)
                Text(String(surah.sequenceNo ?? 0)).foregroundColor(Color.primary).fontWeight(.medium)
            }
            Spacer().frame(width: 12)
            
            VStack(alignment: .leading){
                Text("পারা - \(englishToBengaliNumber(number: String(surah.sequenceNo ?? 0)))").font(.system(size: 16)).fontWeight(.medium).foregroundColor(Color.gray).fontWeight(.medium)
                Spacer().frame(height: 2)
                Text(surah.name ?? "").foregroundColor(Color.gray).lineLimit(1)
            }
            
            Spacer().frame(width: 10)
        }.padding(.horizontal, 12).padding(.vertical, 10).background(Color.backgroundDark).cornerRadius(8)
    }
}

#Preview {
    ParaName(surah: AllParaDtoItem())
}
