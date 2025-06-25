//
//  Para.swift
//  muslimbd
//
//  Created by Al Faruk on 27/1/25.
//

import SwiftUI

struct Para: View {
    let category: CategoryDtoItem
    let image: ImageResource
    
    var body: some View {
        VStack{
            ForwardButton(category: category)
            
            NavigationLink(destination: ParaScreen(category: category, surah: AllParaDtoItem(
                appLanguage : "en",
                id : "6540beab2178e063694f7031",
                isActive : true,
                name : "আল ফাতিহা (১:৭) - আল বাকারাহ (২:১৪১)",
                sequenceNo : 1,
                surahMapping : "1 - 2"
            )), label: {
                VStack (alignment: .leading){
                    Image(image).resizable()
                    Text("بِسْمِ ٱللَّهِ ٱلرَّحْمَـٰنِ ٱلرَّحِيمِ ١ ٱلْحَمْدُ لِلَّهِ رَبِّ ٱلْعَـٰلَمِينَ").font(.system(size: 16)).foregroundStyle(Color.gray).lineLimit(1).padding(.horizontal, 10).padding(.top, 5)
                    Text("পারা ১ | আল ফাতিহা (১:৭) - আল বাকারাহ (২:১৪১)").foregroundStyle(Color.grayLight).lineLimit(1).padding(.horizontal, 10)
                    
                    HStack{
                        Text("সম্পূর্ণ পারাটি পড়ুন").foregroundColor(Color.primary).padding(.horizontal, 10).fontWeight(.medium)
                        Image(systemName: "chevron.right").resizable().frame(width: 10, height: 12).foregroundColor(Color.primary)
                    }
                    
                    Spacer().frame(height: 10)
                }.background(Color.white).clipShape(RoundedRectangle(cornerRadius: 10)).padding(.horizontal, 10).clipped().shadow(radius: 2)
            })
        }.padding(.bottom, 5)
    }
}
