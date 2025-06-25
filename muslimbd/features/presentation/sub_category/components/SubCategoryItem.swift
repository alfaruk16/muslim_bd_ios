//
//  SubCategoryItem.swift
//  muslimbd
//
//  Created by Al Faruk on 16/1/25.
//

import SwiftUI

struct SubCategoryItem: View {
    let subCategory: CategoryDtoItem
    
    var body: some View {
        HStack{
            AsyncImage(url: URL(string: (subCategory.contentBaseURL ?? "") + (subCategory.imageURL ?? ""))) { image in
                image
                    .resizable()
                    .scaledToFit()
                    .frame(width: 24, height: 24)
            } placeholder: {
                ProgressView()
            }
            Spacer().frame(width: 12)
            Text(subCategory.name ?? "").font(.system(size: 20)).lineLimit(1).foregroundStyle(Color.gray)
            Spacer()
            if(subCategory.totalContent != nil && subCategory.category != AppConstants.wallPaperId){
                Text(String(subCategory.totalContent ?? 0)).font(.system(size: 20)).lineLimit(1).foregroundStyle(Color.gray)
            }
            Spacer().frame(width: 12)
            Image(systemName: "chevron.right").resizable().frame(width: 12, height: 16).foregroundStyle(Color.gray)
        }.padding(15).background(Color.backgroundDark).cornerRadius(8).padding(.horizontal, 10)
    }
}
