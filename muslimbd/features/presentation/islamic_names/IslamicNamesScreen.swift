//
//  CategoryScreen.swift
//  muslimbd
//
//  Created by Al Faruk on 12/1/25.
//

import SwiftUI

struct IslamicNamesScreen: View {
    let category: CategoryDtoItem
    
    @Environment(\.dismiss) var dismiss
    
    @StateObject var viewmodel = IslamicNamesViewModel()
    
    let width = UIScreen.main.bounds.width / 1.75
    
    var body: some View {
        let state = viewmodel.state
        
        NavigationStack {
            
            ZStack (alignment: .top){
                
                ScrollView{
                    LazyVStack{
                        Spacer().frame(height: 10)
                        
                        IslamicNameTab(selectedTab: state.selectedTab, tabChanged: { it in
                            viewmodel.tabChanged(index: it)
                        }).padding(.horizontal, 10)
                        
                        
                        if(state.male.data != nil && state.selectedTab == 0){
                            ForEach(0..<(state.male.data?.count ?? 0), id: \.self) { index in
                                Name(name: state.male.data?[index] ?? IslamicNamesDtoItem(), index: index)
                            }
                        }else if(state.female.data != nil && state.selectedTab == 1) {
                            ForEach(0..<(state.female.data?.count ?? 0), id: \.self) { index in
                                Name(name: state.female.data?[index] ?? IslamicNamesDtoItem(), index: index)
                            }
                        }
                        
                        
                        Spacer().frame(height: 20)
                        
                    }.padding(.horizontal, 10)
                    
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
    IslamicNamesScreen(category: CategoryDtoItem(name: "Category", icon: .home))
}
