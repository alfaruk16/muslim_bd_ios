//
//  Scholars.swift
//  muslimbd
//
//  Created by Al Faruk on 11/3/25.
//

import SwiftUI

struct Scholars: View {
    let scholars: ArtistDto
    
    let width = UIScreen.main.bounds.width
    
    var body: some View {
        VStack(alignment: .leading){
            
            HStack {
                Image(.artist).resizable().frame(width: 24, height: 24)
                Spacer().frame(width: 8)
                Text(AppConstants.videoScholar).font(.system(size: 18)).fontWeight(.medium).foregroundColor(Color.gray)
                Spacer()
            }.padding(.horizontal, 10).padding(.top, 10)
        }
        
        GeometryReader(content: { geometry in
            let size = geometry.size
            
            ScrollView(.horizontal) {
                HStack(spacing: 5) {
                    ForEach(scholars.data ?? [], id: \.id) { (item: ArtistDtoItem) in
                        NavigationLink(destination: ScholarVideosScreen(category: CategoryDtoItem(name: AppConstants.videoScholar, icon: .artist), artist: item), label: {
                            
                            VStack{
                                
                                GeometryReader(content: { proxy in
                                    let cardSize = proxy.size
                                    
                                    AsyncImage(url: URL(string: (item.contentBaseUrl ?? "") + replaceSize(url: (item.imageUrl ?? ""), replaceWith: hundredNinetyTwo))){ image in
                                        
                                        image.resizable().aspectRatio(contentMode: .fill)
                                            .frame(width: cardSize.width, height: cardSize.height)
                                            .clipShape(.rect(topLeadingRadius: 15, topTrailingRadius: 15))
                                        
                                    } placeholder: {
                                        //ProgressView()
                                    }
                                })
                                VStack{
                                    Text(item.name ?? "").font(.system(size: 16)).foregroundColor(Color.gray).lineLimit(1)
                                    Text(String(item.totalTrack ?? 0) +  " Contents").font(.system(size: 14)).foregroundColor(Color.grayLight).lineLimit(1)
                                }.frame(height: 40).padding(.bottom, 10)
                                
                            }.background(Color.backgroundDark).clipShape(RoundedRectangle(cornerRadius: 15)).frame(width: size.width - 110)
                                .scrollTransition(.interactive, axis: .horizontal){
                                    view, phase in
                                    view.scaleEffect(phase.isIdentity ? 1 : 0.9)
                                }
                        })
                        
                    }
                }.padding(.horizontal, 55)
                    .scrollTargetLayout()
                    .frame(height: size.height, alignment: .top)
                
            }
            .scrollTargetBehavior(.viewAligned)
            .scrollIndicators(.hidden)
            
        }).frame(height: width - 80)
        
    }
    
}

#Preview {
    Scholars(scholars: ArtistDto(data: [ArtistDtoItem(name: "Name"), ArtistDtoItem(name: "Name 2")]))
}
