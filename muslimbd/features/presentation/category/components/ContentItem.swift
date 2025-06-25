//
//  ContentItem.swift
//  muslimbd
//
//  Created by Al Faruk on 13/1/25.
//

import SwiftUI

struct ContentItem: View {
    internal init(contentItem: TextContentDtoItem, currentContent: TextContentDtoItem = TextContentDtoItem()) {
        self.contentItem = contentItem
        self.currentContent = currentContent
    }
    
    let contentItem: TextContentDtoItem
    let currentContent: TextContentDtoItem
    
    var body: some View {
        VStack{
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
                Image(systemName: "chevron.right").resizable().frame(width: 12, height: 16).foregroundStyle(Color.gray)
            }
            if(currentContent.id != nil && contentItem.id == currentContent.id){
                ContentDetails(content: currentContent)
            }
        }.padding(15).background(Color.backgroundDark).cornerRadius(8).padding(.horizontal, 10)
    }
}

#Preview {
    ContentItem(contentItem: TextContentDtoItem(title: "Title"))
}
