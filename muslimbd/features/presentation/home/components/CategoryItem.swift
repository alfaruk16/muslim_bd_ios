//
//  CategoryItem.swift
//  muslimbd
//
//  Created by Al Faruk on 30/12/24.
//

import SwiftUI

struct CategoryItem: View {
    let category: CategoryDtoItem
    
    var body: some View {
            ZStack {
                RoundedRectangle(cornerRadius: 10)
                    .fill(Color.backgroundDark)

                VStack(spacing: 10) {
                    AsyncImage(url: URL(string: (category.contentBaseURL ?? "") + (category.imageURL ?? ""))) { image in
                        image
                            .resizable()
                            .scaledToFit()
                            .frame(height: 40)
                    } placeholder: {
                        ProgressView()
                    }
                    Text(category.name ?? "")
                        .multilineTextAlignment(.center).foregroundStyle(.black).font(.system(size: 14))
                }
                
            }.clipped().shadow(radius: 1)
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .aspectRatio(1, contentMode: .fit)
    }
}
