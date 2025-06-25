//
//  ImageContents.swift
//  muslimbd
//
//  Created by Al Faruk on 26/1/25.
//

import SwiftUI

struct ImageContents: View {
    let category: CategoryDtoItem
    let contents: ImageContentsDto
    let width: Double
    let height: Double
        
    var body: some View {
        VStack{
            ForwardButton(category: category)
            ScrollView (.horizontal){
                LazyHStack{
                    ForEach(contents.data ?? [], id: \.id) { (item: ImageContentDtoItem) in
                        NavigationLink(destination: ContentScreen(category: category, content: item.toTextContentDtoItem()), label: {
                            AsyncImage(url: URL(string: (item.contentBaseUrl ?? "") + (item.imageUrl ?? ""))){ image in
                                image.resizable().frame(width: width, height: height).clipShape(RoundedRectangle(cornerRadius: 10)).shadow(radius: 2).padding(2)
                            }placeholder: {
                                ProgressView()
                            }
                        })
                    }
                }.padding(.horizontal, 10)
            }
        }
    }
}

#Preview {
    ImageContents(category: CategoryDtoItem(), contents: ImageContentsDto(data: [ImageContentDtoItem()]), width: 100, height: 100)
}

