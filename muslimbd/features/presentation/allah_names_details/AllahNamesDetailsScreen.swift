//
//  CategoryScreen.swift
//  muslimbd
//
//  Created by Al Faruk on 12/1/25.
//

import SwiftUI

struct AllahNamesDetailsScreen: View {
    let category: CategoryDtoItem
    let allahName: AllahNamesDtoItem
    
    @Environment(\.dismiss) var dismiss
    
    @StateObject var viewmodel = AllahNamesDetailsViewModel()
    @StateObject private var audioPlayer = AudioPlayer()
    
    let width = UIScreen.main.bounds.width / 1.75
    
    
    
    var body: some View {
        let state = viewmodel.state
        
        NavigationStack {
            
            ZStack (alignment: .top){
                
                ScrollView{
                    LazyVStack{
                        
                        if(state.allahName.id != nil){
                            
                            AllahNameDetails(allahName: state.allahName)
                                                        
                        }
                        
                        Spacer().frame(height: 20)
                        
                    }.padding(.top, 30).padding(.horizontal, 10)
                    
                }
                
                VStack{
                    Spacer()
                    HStack(){
                        Spacer()
                        Button(action: {
                            viewmodel.prev(){ url in
                                audioPlayer.play(url: url)
                            }
                        }) {
                            Image(systemName: "backward.fill").resizable()
                                .foregroundColor(Color.gray).frame(width: 30, height: 20)
                        }
                        Spacer()
                        Button(action: {
                            viewmodel.next(){ url in
                                audioPlayer.play(url: url)
                            }
                            
                        }) {
                            Image(systemName: "forward.fill").resizable()
                                .foregroundColor(Color.gray).frame(width: 30, height: 20)
                        }
                        Spacer()
                    }.frame(height: 60).background(Color.white).clipShape(.rect(topLeadingRadius: 20, topTrailingRadius: 20))
                    
                }
                
                VStack {
                    Spacer()
                    
                    ZStack(alignment: Alignment.center) {
                        Circle()
                            .fill(Color.backgroundDark).frame(width: 60, height: 60)
                        
                        Circle()
                            .fill(Color.primary)
                            .padding(10).frame(width: 60, height: 60)
                        
                        Image(systemName: audioPlayer.currentUrl == (state.allahName.contentBaseUrl ?? "") + (state.allahName.contentUrl ?? "") ? "pause.fill" : "play.fill").resizable()
                            .foregroundColor(Color.white).frame(width: 16, height: 16)
                        
                        
                    }.padding(.bottom, 20).onTapGesture(perform:{
                        audioPlayer.play(url: (state.allahName.contentBaseUrl ?? "") + (state.allahName.contentUrl ?? ""))
                    })
                }
                
            }.background(Color.backgroundColor).frame(maxHeight: .infinity, alignment: .top)
                .navigationBarTitleDisplayMode(.inline)
                .toolbar{
                    ToolbarItem(placement: .principal) {
                        AppBar(title: category.name ?? "", icon: category.icon, image: (category.contentBaseURL ?? "") + (category.imageURL ?? ""), dismiss: { dismiss() })
                    }
                }
        }.navigationBarBackButtonHidden(true)
            .onAppear(perform: {
                viewmodel.initiate(category: category, name: allahName)
            })
        
    }
}


#Preview {
    AllahNamesDetailsScreen(category: CategoryDtoItem(name: "Allah Names Details", icon: .home), allahName: AllahNamesDtoItem())
}
