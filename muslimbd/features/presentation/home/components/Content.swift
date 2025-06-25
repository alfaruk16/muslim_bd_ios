//
//  Content.swift
//  muslimbd
//
//  Created by Al Faruk on 27/1/25.
//

import SwiftUI

struct Content: View {
    let category: CategoryDtoItem
    let image: ImageResource
    let content: TextContentDtoItem
    
    var body: some View {
        VStack{
            ForwardButton(category: category)
            
            NavigationLink(destination: ContentScreen(category: category, content: content), label: {
                VStack (alignment: .leading){
//                    if(content.billBoardImageUrl != nil){
//                        AsyncImage(url: URL(string: (content.contentBaseUrl ?? "") + (content.billBoardImageUrl ?? ""))) { image in
//                            image.resizable()
//                        }placeholder: {
//                            ProgressView()
//                        }
//                    }else{
                        Image(image).resizable()
//                    }
                    Text(content.title ?? "").font(.system(size: 16)).foregroundStyle(Color.gray).lineLimit(1).padding(.horizontal, 10).padding(.top, 5)
                    Spacer().frame(height: 2)
                    Text(content.text ?? "").foregroundStyle(Color.grayLight).lineLimit(1).padding(.horizontal, 10).font(.system(size: 14))
                    Spacer().frame(height: 10)
                }.background(Color.white).clipShape(RoundedRectangle(cornerRadius: 10)).padding(.horizontal, 10).clipped().shadow(radius: 2)
            })
        }.padding(.bottom, 5)
    }
}
