//
//  SurahName.swift
//  muslimbd
//
//  Created by Al Faruk on 20/1/25.
//

import SwiftUI

struct SurahName: View {
    let surah: AlQuranDtoItem
    @StateObject var audioPlayer : AudioPlayer
    
    var body: some View {
        HStack{
            ZStack{
                Image(.allahNameSequence).resizable().frame(width: 36, height: 36)
                Text(String(surah.sequenceNo ?? 0)).foregroundColor(Color.primary).fontWeight(.medium)
            }
            Spacer().frame(width: 12)
            
            VStack(alignment: .leading){
                Text(surah.name ?? "").font(.system(size: 16)).fontWeight(.medium).foregroundColor(Color.gray)
                Spacer().frame(height: 2)
                HStack{
                    Text(String(surah.totalAyat ?? 0) + " Ayaat").foregroundColor(Color.grayLight)
                    Spacer().frame(width: 5, height: 5).background(Circle()).padding(2).foregroundColor(Color.grayLight)
                    Text(surah.origin ?? "").foregroundColor(Color.grayLight)
                }
                
            }
            Spacer()
            Text(surah.nameInArabic ?? "").foregroundColor(Color.primary).font(.system(size: 20)).fontWeight(.medium)
            Spacer().frame(width: 10)
            Image(systemName: audioPlayer.currentUrl == (surah.contentBaseUrl ?? "") + (surah.contentUrl ?? "") ? "pause.fill" : "play.fill").resizable().frame(width: 16, height: 16).foregroundStyle(Color.primary).onTapGesture {
                audioPlayer.play(url: (surah.contentBaseUrl ?? "") + (surah.contentUrl ?? ""))
            }
        }.padding(.horizontal, 12).padding(.vertical, 10).background(Color.backgroundDark).cornerRadius(8)
    }
}

#Preview {
    SurahName(surah: AlQuranDtoItem(about: "", appLanguage: "", ayats: "7", contentBaseUrl: "", contentUrl: "", createdBy: "", createdOn: "", duration: "", id: "", imageUrl: "", isActive: true, name: "Name", nameInArabic: "Arabic", nameMeaning: "Meaning", origin: "origin", pronunciation: "pronounce", sequenceNo: 1, totalAyat: 7, updatedBy: "", updatedOn: "", userFavouritedThis: false), audioPlayer: AudioPlayer())
}
