//
//  JonoprioSura.swift
//  muslimbd
//
//  Created by Al Faruk on 27/1/25.
//

import SwiftUI

struct JonoprioSura: View {
    let category: CategoryDtoItem
    let image: ImageResource
    
    var body: some View {
        VStack{
            ForwardButton(category: category)
            
            NavigationLink(destination: AlQuranScreen(category: category), label: {
                VStack (alignment: .leading){
                    Image(image).resizable()
                }.background(Color.white).clipShape(RoundedRectangle(cornerRadius: 10)).padding(.horizontal, 10).clipped().shadow(radius: 2)
            })
        }
    }
}

