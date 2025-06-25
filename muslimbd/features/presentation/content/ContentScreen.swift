//
//  ContentScreen.swift
//  muslimbd
//
//  Created by Al Faruk on 13/1/25.
//

import SwiftUI

struct ContentScreen: View {
    let category: CategoryDtoItem
    let content: TextContentDtoItem
    
    @Environment(\.dismiss) var dismiss
    
    @StateObject var viewmodel = ContentViewModel()
    
    let width = UIScreen.main.bounds.width / 1.75
    
    
    var body: some View {
        let state = viewmodel.state
        
        NavigationStack {
            
            ZStack (alignment: .top){
                BismillahView(width: width, icon: .bismillah)
                
                ScrollView{
                    LazyVStack{
                        if(state.content.data != nil && (state.category.id == AppConstants.imageCategoryId || state.category.id == AppConstants.panchaStomvoId || state.category.id == AppConstants.wallPaperId)){
                            AsyncImage(url: URL(string: (state.content.data?.contentBaseUrl ?? "") + (state.content.data?.imageUrl ?? ""))){ image in
                                image.resizable().scaledToFit().clipShape(RoundedRectangle(cornerRadius: 20)).padding(.top, width - 30).padding(.horizontal, 30)
                            }placeholder: {}
                        }else{
                            VStack{
                                Spacer().frame(height: 10)
                                Text(content.title ?? "").foregroundStyle(.black).fontWeight(.medium).padding(.horizontal, 10)
                                Spacer().frame(height: 10)
                                
                                ContentDetails(content: content)
                            }
                            .frame(maxWidth: .infinity)
                            .background(
                                LinearGradient(gradient: Gradient(colors: [.gradientColor2, .white]), startPoint: .top, endPoint: .bottom)
                            ).cornerRadius(15)
                                .padding(.horizontal, 20).padding(.top, width - 30)
                                .shadow(radius: 10)
                        }
                    }
                }
                
            }.background(Color.backgroundColor).frame(maxHeight: .infinity, alignment: .top)
                .navigationBarTitleDisplayMode(.inline)
                .toolbar{
                    ToolbarItem(placement: .principal) {
                        AppBar(title: category.name ?? "", icon: category.icon, image: (category.contentBaseURL ?? "") + (category.imageURL ?? ""), dismiss: { dismiss() })
                    }
                }
        }.navigationBarBackButtonHidden(true)
            .onAppear(perform: {
                viewmodel.initiate(category: category, content: content)
            })
        
    }
}


#Preview {
    ContentScreen(category: CategoryDtoItem(name: "Category", icon: .home), content: TextContentDtoItem(address: "address"))
}
