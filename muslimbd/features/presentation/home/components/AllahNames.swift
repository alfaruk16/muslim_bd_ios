//
//  AllahNames.swift
//  muslimbd
//
//  Created by Al Faruk on 28/1/25.
//

import SwiftUI

struct AllahNames: View {
    let category: CategoryDtoItem
    let allahNames: AllahNamesDto
    
    let width = UIScreen.main.bounds.width / 1.5
    @StateObject var audioPlayer = AudioPlayer()
    
    var body: some View {
        VStack{
            ForwardButton(category: category)
            
            ScrollView (.horizontal){
                LazyHStack{
                    ForEach(allahNames.data ?? [], id: \.id){ allahName in
                        NavigationLink(destination: AllahNamesDetailsScreen(category: category, allahName: allahName), label: {
                            VStack(alignment: .leading){
                                ZStack{
                                    Image(.oval).resizable().frame(width: width / 2, height: width / 2)
                                    if(allahName.id == "1"){
                                        Image(.allahText).resizable().frame(width: 50, height: 50)
                                    }else{
                                        Text(allahName.arabic ?? "").foregroundStyle(.white).font(.system(size: 40)).fontWeight(.medium)
                                    }
                                }.frame(maxWidth: .infinity).padding(10).background(
                                    LinearGradient(gradient: Gradient(colors: [.gradientColor2, .gradientColor1]), startPoint: .top, endPoint: .bottom))
                                Spacer().frame(height: 10)
                                
                                HStack{
                                    VStack{
                                        Text(allahName.name ?? "").foregroundStyle(Color.gray).fontWeight(.medium).padding(.horizontal, 10)
                                        Text(allahName.meaning ?? "").foregroundStyle(Color.primary).foregroundStyle(Color.grayLight).padding(.horizontal, 10)
                                    }
                                    Spacer()
                                    ZStack(alignment: Alignment.center) {
                                        
                                        Circle()
                                            .fill(Color.primary)
                                            .frame(width: 40, height: 40)
                                        
                                        Image(systemName: audioPlayer.currentUrl == (allahName.contentBaseUrl ?? "") + (allahName.contentUrl ?? "") ? "pause.fill" : "play.fill").resizable()
                                            .foregroundColor(Color.white).frame(width: 16, height: 16)
                                        
                                        
                                    }.onTapGesture(perform:{
                                        audioPlayer.play(url: (allahName.contentBaseUrl ?? "") + (allahName.contentUrl ?? ""))
                                    })
                                    Spacer().frame(width: 10)
                                }
                            }.frame(width: width).background(Color.white).clipShape(RoundedRectangle(cornerRadius: 10)).clipped().shadow(radius: 2).padding(2)
                        })
                    }
                }.padding(.horizontal, 10)
            }
        }
        
        
    }
}

#Preview {
    AllahNames(category: CategoryDtoItem(), allahNames: AllahNamesDto(data: [AllahNamesDtoItem()]))
}
