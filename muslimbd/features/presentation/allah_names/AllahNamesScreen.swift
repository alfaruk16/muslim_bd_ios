//
//  CategoryScreen.swift
//  muslimbd
//
//  Created by Al Faruk on 12/1/25.
//

import SwiftUI

struct AllahNamesScreen: View {
    let category: CategoryDtoItem
    
    @Environment(\.dismiss) var dismiss
    
    @StateObject var viewmodel = AllahNamesViewModel()
    @StateObject var audioPlayer = AudioPlayer()
    
    let width = UIScreen.main.bounds.width / 1.75
    
    
    var body: some View {
        let state = viewmodel.state
        
        NavigationStack {
            
            ZStack (alignment: .top){
                BismillahView(width: width, icon: .bismillah)
                
                ScrollView{
                    LazyVStack{
                        if(state.allahNames.data != nil){
                            ForEach(state.allahNames.data ?? [], id: \.id){ item in
                                
                                NavigationLink(destination: AllahNamesDetailsScreen(category: category, allahName: item), label: {
                                    AllahName(name: item, audioPlayer: audioPlayer)
                                })
                                
                                
                            }
                        }
                        
                        Spacer().frame(height: 20)
                        
                    }.padding(.top, width - 30).padding(.horizontal, 10)
                    
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
                viewmodel.initiate(category: category)
            })
        
    }
}


#Preview {
    SubCategoryScreen(category: CategoryDtoItem(name: "Category", icon: .home))
}
