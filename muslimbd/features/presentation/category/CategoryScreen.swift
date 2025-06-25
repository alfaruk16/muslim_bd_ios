//
//  CategoryScreen.swift
//  muslimbd
//
//  Created by Al Faruk on 12/1/25.
//

import SwiftUI

struct CategoryScreen: View {
    let category: CategoryDtoItem
    
    @Environment(\.dismiss) var dismiss
    
    @StateObject var viewmodel = CategoryViewModel()
    
    let width = UIScreen.main.bounds.width / 1.75
    
    var body: some View {
        let state = viewmodel.state
        
        NavigationStack {
            
            ZStack (alignment: .top){
                BismillahView(width: width, icon: .bismillah)
                
                ScrollView{
                    LazyVStack{
                        
                        if(category.id == AppConstants.zakatId){
                            NavigationLink(destination: ZakatCalculatorScreen(category: category), label: {
                                ZakatCalculatorButton()
                            })
                        }
                        
                        if(category.id == AppConstants.prayerLearningId || category.id == AppConstants.malePrayerId || category.id == AppConstants.femalePrayerId){
                            PrayerLearningTabs(selectedTab: state.selectedTab, tabChanged: { it in
                                viewmodel.tabChanged(index: it)
                            }).padding(.horizontal, 10)
                        }

                        if(state.imageContents.data != nil){
                            ForEach(state.imageContents.data ?? [], id: \.id){ item in
                                ImageContent(content: item)
                            }
                        }
                        
                        if(state.malePrayer.data != nil && state.selectedTab == 0){
                            ForEach(state.malePrayer.data ?? [], id: \.id) { item in
                                ContentItem(contentItem: item, currentContent: state.currentContent).onTapGesture {
                                    viewmodel.updateCurrentContent(content: item)
                                }
                            }
                        }else if(state.femalePrayer.data != nil && state.selectedTab == 1) {
                            ForEach(state.femalePrayer.data ?? [], id: \.id) { item in
                                ContentItem(contentItem: item, currentContent: state.currentContent).onTapGesture {
                                    viewmodel.updateCurrentContent(content: item)
                                }
                            }
                        }
                        else if(state.categoryContents.data != nil){
                            ForEach(state.categoryContents.data ?? [], id: \.id) { item in
                                NavigationLink(destination: ContentScreen(category: category, content: item), label: {
                                    switch (item.category){
                                    case AppConstants.historicalPlaceId : HistoricalPlaceItem(contentItem: item)
                                    default: ContentItem(contentItem: item)
                                    }
                                })
                            }
                        }
                        
                        Spacer().frame(height: 20)
                        
                    }.padding(.top, width - 40).padding(.horizontal, 10)
                    
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
    CategoryScreen(category: CategoryDtoItem(name: "Category", icon: .home))
}
