//
//  Categories.swift
//  muslimbd
//
//  Created by Al Faruk on 28/1/25.
//

import SwiftUI

struct CategoriesView: View {
    let categories: CategoryDto
    let isShowMore: Bool
    
    var body: some View {
        LazyVGrid(columns: [GridItem(.adaptive(minimum: 100))]){
            
            ForEach(isShowMore ? Array(categories.data?[0...5] ?? []) : categories.data ?? [], id: \.id){ item in
                NavigationLink(destination: {
                    switch(item.id){
                    case AppConstants.dailyDuaId, AppConstants.hajjId, AppConstants.ramjanId, AppConstants.wallPaperId: SubCategoryScreen(category: item)
                    case AppConstants.allahNamesId: AllahNamesScreen(category: item)
                    case AppConstants.tasbeehId: TashbeehScreen(category: item)
                    case AppConstants.alQuranId: AlQuranScreen(category: item)
                    case AppConstants.jonoprioSuraId: AlQuranScreen(category: item)
                    case AppConstants.artistVideoId: VideoArtistScreen(category: item)
                    default: CategoryScreen(category: item)
                    }
                }, label: { CategoryItem(category: item)})
                
            }
            
        }.gridCellColumns(3).padding(10)
    }
}
