//
//  CategoryScreen.swift
//  muslimbd
//
//  Created by Al Faruk on 12/1/25.
//

import SwiftUI

struct SurahScreen: View {
    let category: CategoryDtoItem
    let surahItem: AlQuranDtoItem
    
    @Environment(\.dismiss) var dismiss
    
    @StateObject var viewmodel = SurahViewModel()
    @StateObject var  audioPlayer: AudioPlayer
    
    let width = UIScreen.main.bounds.width / 1.75
    
    
    var body: some View {
        let state = viewmodel.state
        
        NavigationStack {
            
            VStack (alignment: .leading){
                HStack{
                    VStack(alignment: .leading){
                        Text(state.surahItem.name ?? "").font(.system(size: 16)).fontWeight(.medium).foregroundColor(Color.gray)
                        Spacer().frame(height: 2)
                        HStack{
                            Text(String(state.surahItem.totalAyat ?? 0) + " Ayaat").foregroundColor(Color.grayLight)
                            Spacer().frame(width: 5, height: 5).background(Circle()).padding(2).foregroundColor(Color.grayLight)
                            Text(state.surahItem.origin ?? "").foregroundColor(Color.grayLight)
                        }
                        
                    }
                    Spacer()
                    Text(state.surahItem.nameInArabic ?? "").foregroundColor(Color.primary).font(.system(size: 20)).fontWeight(.medium)
                    Spacer().frame(width: 10)
                    Image(systemName: "chevron.down").resizable().frame(width: 12, height: 8).foregroundStyle(Color.primary)
                }.padding(15).background(Color.white)
                
                ScrollView{
                    LazyVStack{
                        
                        ForEach(state.surah.data ?? [], id: \.id){ item in
                            
                            Ayaat(ayaat: item, surah: state.surahItem)
                        }
                        
                        Spacer().frame(height: 20)
                        
                    }.padding(.horizontal, 10)
                    
                }
                
                HStack{
                    Image(.playerImg).resizable().frame(width: 50,  height: 50)
                    Spacer().frame(width: 10)
                    VStack(alignment: .leading){
                        Text(state.surahItem.name ?? "").font(.system(size: 16)).fontWeight(.medium).foregroundColor(Color.gray)
                        Spacer().frame(height: 2)
                        HStack{
                            Text(String(state.surahItem.totalAyat ?? 0) + " Ayaat").foregroundColor(Color.grayLight)
                            Spacer().frame(width: 5, height: 5).background(Circle()).padding(2).foregroundColor(Color.grayLight)
                            Text(state.surahItem.origin ?? "").foregroundColor(Color.grayLight)
                        }
                        
                    }
                    Spacer()
                    Spacer().frame(width: 10)
                    Button(action: {
                        viewmodel.prev(){ url in
                            audioPlayer.play(url: url)
                        }
                    }) {
                        Image(systemName: "backward.fill").resizable()
                            .foregroundColor(Color.gray).frame(width: 30, height: 20)
                    }
                    Spacer().frame(width: 10)
                    ZStack(alignment: Alignment.center) {
                        
                        Circle()
                            .fill(Color.primary)
                            .frame(width: 40, height: 40)
                        
                        Image(systemName: audioPlayer.currentUrl == (state.surahItem.contentBaseUrl ?? "") + (state.surahItem.contentUrl ?? "") ? "pause.fill" : "play.fill").resizable()
                            .foregroundColor(Color.white).frame(width: 16, height: 16)
                        
                        
                    }.onTapGesture(perform:{
                        audioPlayer.play(url: (state.surahItem.contentBaseUrl ?? "") + (state.surahItem.contentUrl ?? ""))
                    })
                    Spacer().frame(width: 10)
                    Button(action: {
                        viewmodel.next(){ url in
                            audioPlayer.play(url: url)
                        }
                        
                    }) {
                        Image(systemName: "forward.fill").resizable()
                            .foregroundColor(Color.gray).frame(width: 30, height: 20)
                    }
                    Spacer().frame(width: 10)
                }.padding(10).background(Color.white).clipShape(.rect(topLeadingRadius: 15, topTrailingRadius: 15))
                
            }.background(Color.backgroundColor).frame(maxHeight: .infinity, alignment: .top)
                .navigationBarTitleDisplayMode(.inline)
                .toolbar{
                    ToolbarItem(placement: .principal) {
                        AppBar(title: category.name ?? "", icon: category.icon, image: (category.contentBaseURL ?? "") + (category.imageURL ?? ""), dismiss: { dismiss() })
                    }
                }
        }.navigationBarBackButtonHidden(true)
            .onAppear(perform: {
                viewmodel.initiate(category: category, surahItem: surahItem)
            })
        
    }
}


#Preview {
    SurahScreen(category: CategoryDtoItem(name: "Category", icon: .home), surahItem: AlQuranDtoItem(), audioPlayer: AudioPlayer())
}
