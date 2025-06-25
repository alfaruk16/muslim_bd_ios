//
//  SingleContent.swift
//  muslimbd
//
//  Created by Al Faruk on 26/1/25.
//

import SwiftUI

struct Kalima: View {
    let category: CategoryDtoItem
    let image: ImageResource
    let content: TextContentDtoItem
    
    var body: some View {
        VStack{
            ForwardButton(category: category)
            
            NavigationLink(destination: ContentScreen(category: category, content: content), label: {
                VStack (alignment: .leading){
                    Image(image).resizable()
                    Text(content.textInArabic ?? "").font(.system(size: 16)).foregroundStyle(Color.gray).lineLimit(1).padding(.horizontal, 10).padding(.top, 5)
                    Text(content.pronunciation ?? "").foregroundStyle(Color.grayLight).lineLimit(1).padding(.horizontal, 10)
                    
                    HStack{
                        Text("সম্পূর্ণটি পড়ুন").foregroundColor(Color.primary).padding(.horizontal, 10).fontWeight(.medium)
                        Image(systemName: "chevron.right").resizable().frame(width: 10, height: 12).foregroundColor(Color.primary)
                    }
                    
                    Spacer().frame(height: 10)
                }.background(Color.white).clipShape(RoundedRectangle(cornerRadius: 10)).padding(.horizontal, 10).clipped().shadow(radius: 2)
            })
        }.padding(.bottom, 5)
    }
}
