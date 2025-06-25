//
//  ArtistView.swift
//  muslimbd
//
//  Created by Al Faruk on 12/3/25.
//

import SwiftUI

struct ArtistView: View {
    let artist: ArtistDtoItem
    
    let width = UIScreen.main.bounds.width
    
    var body: some View {
        VStack{
            AsyncImage(url: URL(string: (artist.contentBaseUrl ?? "") + replaceSize(url: (artist.imageUrl ??  ""), replaceWith: threeHundred))){ image in
                image.resizable().frame(width: width / 2, height: width / 2).clipShape(Circle())
                
            } placeholder: {
            
            }
            Spacer().frame(height: 10)
            
            Text(artist.name ?? "").foregroundColor(Color.gray).lineLimit(1).font(.system(size: 20))
            Text(artist.about ?? "").foregroundColor(Color.grayLight).padding(.horizontal, 10)
        }
    }
}
