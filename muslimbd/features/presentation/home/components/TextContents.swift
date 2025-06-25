//
//  TextContents.swift
//  muslimbd
//
//  Created by Al Faruk on 26/1/25.
//

import SwiftUI

struct TextContents: View {
    let category: CategoryDtoItem
    let contents: CategoryContentsDto
    let color: Color
    
    let width = UIScreen.main.bounds.width / 1.5
    
    var body: some View {
        VStack{
            ForwardButton(category: category)
            ScrollView (.horizontal){
                LazyHStack (alignment: .top){
                    ForEach(contents.data ?? [], id: \.id) { (item: TextContentDtoItem) in
                        NavigationLink(destination: {
                            switch(category.id){
                            case AppConstants.tasbeehId: TashbeehScreen(category: category)
                            default: ContentScreen(category: category, content: item)
                            }
                        }, label: {
                            VStack (alignment: .leading){
                                Image(category.icon ?? .alQuran).frame(width: 30, height: 30, alignment: .center).padding(15).foregroundStyle(Color.white).background(Color.white).clipShape(Circle())
                                Text(item.title ?? "").foregroundColor(.black).fontWeight(.medium).lineLimit(1).padding(.vertical, 2)
                                if(item.textInArabic != nil){
                                    Text(item.textInArabic ?? "").fontWeight(.medium).foregroundColor(.black).lineLimit(2).padding(.vertical, 2)
                                }
                                if(item.text != nil){
                                    Text(item.text ?? "").foregroundColor(Color.gray).fontWeight(.medium).lineLimit(2).padding(.vertical, 2)
                                }
                            }.frame(width: width).padding(10).background(LinearGradient(gradient: Gradient(colors: [color, .white]), startPoint: .top, endPoint: .bottom)).clipShape(RoundedRectangle(cornerRadius: 10)).clipped().shadow(radius: 2).padding(2)
                        })
                    }
                }.padding(.horizontal, 10)
            }
        }
    }
}

#Preview {
    TextContents(category: CategoryDtoItem(), contents: CategoryContentsDto(data: [TextContentDtoItem(text: "text", textInArabic: "Arabic", title: "title")]), color: Color.textGradientColor)
}
