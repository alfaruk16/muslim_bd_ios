//
//  ForwardButton.swift
//  muslimbd
//
//  Created by Al Faruk on 26/1/25.
//

import SwiftUI

struct ForwardButton: View {
    let category: CategoryDtoItem
    
    var body: some View {
        HStack {
            if(category.icon != nil){
                Image(category.icon ?? .logo).resizable().frame(width: 24, height: 24)
            }else{
                AsyncImage(url: URL(string: (category.contentBaseURL ?? "") + (category.imageURL ?? ""))){ image in
                    image.resizable().frame(width: 24, height: 24)
                }placeholder: {}
            }
            Spacer().frame(width: 8)
            Text(category.name ?? "").font(.system(size: 18)).fontWeight(.medium).foregroundColor(Color.gray)
            Spacer()
            NavigationLink(destination: {
                switch(category.id){
                case AppConstants.alQuranId, AppConstants.jonoprioSuraId: AlQuranScreen(category: category)
                case AppConstants.tasbeehId: TashbeehScreen(category: category)
                case AppConstants.wallPaperId: SubCategoryScreen(category: category)
                case AppConstants.paraId: AllParaScreen(category: category)
                case AppConstants.islamicNameId: IslamicNamesScreen(category: category)
                case AppConstants.allahNamesId: AllahNamesScreen(category: category)
                case AppConstants.artistVideoId: VideoArtistScreen(category: category)
                case AppConstants.artistAudioId: AudioArtistScreen(category: category)
                default: CategoryScreen(category: category)
                }
            }, label: {
                Image(systemName: "chevron.right").frame(width: 30, height: 30).background(Color.greenLight).clipShape(Circle()).foregroundStyle(.black)
            })
            
        }.padding(.horizontal, 10).padding(.top, 10)
    }
}

#Preview {
    ForwardButton(category: CategoryDtoItem(name: "name", icon: .logo))
}
