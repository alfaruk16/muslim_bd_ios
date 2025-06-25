//
//  IslamicNames.swift
//  muslimbd
//
//  Created by Al Faruk on 28/1/25.
//

import SwiftUI

struct IslamicNames: View {
    let category: CategoryDtoItem
    
    var body: some View {
        VStack{
            ForwardButton(category: category)
            HStack{
                NavigationLink(destination: IslamicNamesScreen(category: CategoryDtoItem(name: AppConstants.islamicName, id: AppConstants.islamicNameId, icon: .islamicNames, selectedTab: 0)), label: {
                    Item(image: .boy, name: AppConstants.boy, color: Color.gradientColor2)
                })
                NavigationLink(destination: IslamicNamesScreen(category: CategoryDtoItem(name: AppConstants.islamicName, id: AppConstants.islamicNameId, icon: .islamicNames, selectedTab: 1)), label: {
                    Item(image: .girl, name: AppConstants.girl, color: Color.gradientColor1)
                })
            }.padding(.horizontal, 10)
        }
        
    }
}

struct Item: View {
    let image: ImageResource
    let name: String
    let color: Color
    
    let height = UIScreen.main.bounds.width / 3
    
    var body: some View{
        VStack{
            Spacer().frame(height: 10)
            Image(image).resizable().clipShape(RoundedRectangle(cornerRadius: 10)).padding(.horizontal, 2).scaledToFit()
            Text(name).foregroundColor(Color.gray)
            Spacer().frame(height: 10)
        }.frame(maxWidth: .infinity).frame(height: height).background(LinearGradient(gradient: Gradient(colors: [color, .white]), startPoint: .top, endPoint: .bottom)).clipShape(RoundedRectangle(cornerRadius: 10)).clipped().shadow(radius: 2)
    }
}

#Preview{
    IslamicNames(category: CategoryDtoItem())
}
