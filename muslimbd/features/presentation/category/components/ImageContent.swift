//
//  ImageContent.swift
//  muslimbd
//
//  Created by Al Faruk on 14/1/25.
//

import SwiftUI

struct ImageContent: View {
    let content: ImageContentDtoItem
    
    var body: some View {
        ZStack{
            AsyncImage(url: URL(string: (content.contentBaseUrl ?? "") + (content.imageUrl ?? ""))) { image in
                image
                    .resizable()
                    .scaledToFit().cornerRadius(20).padding(.horizontal, 10).padding(.vertical, 5)
            } placeholder: {
                ProgressView()
            }
        }
    }
}
