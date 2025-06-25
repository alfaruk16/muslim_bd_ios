//
//  Quran.swift
//  muslimbd
//
//  Created by Al Faruk on 27/1/25.
//

import SwiftUI

struct Quran: View {
    let category: CategoryDtoItem
    let image: ImageResource
    
    var body: some View {
        VStack{
            ForwardButton(category: category)
            
            NavigationLink(destination: SurahScreen(category: category, surahItem: AlQuranDtoItem(
                appLanguage : "Bn",
                contentBaseUrl : "https://v4technologies.sgp1.cdn.digitaloceanspaces.com/muslimbd/",
                contentUrl : "surah/bn/bn_audio/1.mp3",
                duration : "00:38",
                id : "1-bn",
                isActive : true,
                name : "আল ফাতিহা",
                nameInArabic : "ٱلْفَاتِحَة",
                nameMeaning : "সূচনা, origin=মাক্কী",
                sequenceNo : 1,
                totalAyat : 7
            ), audioPlayer: AudioPlayer()), label: {
                VStack (alignment: .leading){
                    Image(image).resizable()
                    Text("بِسْمِ ٱللَّهِ ٱلرَّحْمَـٰنِ ٱلرَّحِيمِ ١ ٱلْحَمْدُ لِلَّهِ رَبِّ ٱلْعَـٰلَمِينَ").font(.system(size: 16)).foregroundStyle(Color.gray).lineLimit(1).padding(.horizontal, 10).padding(.top, 5)
                    Text("সূরা আল ফাতিহা | আয়াত সংখ্যা - ৭").foregroundStyle(Color.grayLight).lineLimit(1).padding(.horizontal, 10)
                    
                    HStack{
                        Text("সম্পূর্ণ সূরাটি পড়ুন").foregroundColor(Color.primary).padding(.horizontal, 10).fontWeight(.medium)
                        Image(systemName: "chevron.right").resizable().frame(width: 10, height: 12).foregroundColor(Color.primary)
                    }
                    
                    Spacer().frame(height: 10)
                }.background(Color.white).clipShape(RoundedRectangle(cornerRadius: 10)).padding(.horizontal, 10).clipped().shadow(radius: 2)
            })
        }.padding(.bottom, 5)
    }
}
