//
//  HistoricalPlaceItem.swift
//  muslimbd
//
//  Created by Al Faruk on 14/1/25.
//

import SwiftUI

struct HistoricalPlaceItem: View {
    let contentItem: TextContentDtoItem
    
    var body: some View {
        VStack{
            AsyncImage(url: URL(string: (contentItem.contentBaseUrl ?? "") + (contentItem.billBoardImageUrl ?? ""))) { image in
                image.resizable().scaledToFit().cornerRadius(8)
            } placeholder: {
                ProgressView()
            }
            
            HStack{
                AsyncImage(url: URL(string: (contentItem.contentBaseUrl ?? "") + (contentItem.imageUrl ?? ""))) { image in
                    image
                        .resizable()
                        .scaledToFit()
                        .frame(width: 24, height: 24)
                } placeholder: {
                    ProgressView()
                }
                Spacer().frame(width: 12)
                Text(contentItem.title ?? "").font(.system(size: 20)).lineLimit(1).foregroundStyle(Color.gray)
                Spacer()
                Image(systemName: "chevron.right").resizable().frame(width: 16, height: 16).foregroundStyle(Color.gray)
            }.padding(.horizontal, 15).padding(.bottom, 15).padding(.top, 10)
        }.background(Color.backgroundDark).cornerRadius(8).padding(.horizontal, 10)
    }
}

#Preview {
    HistoricalPlaceItem(contentItem: TextContentDtoItem(title: "Title"))
}

