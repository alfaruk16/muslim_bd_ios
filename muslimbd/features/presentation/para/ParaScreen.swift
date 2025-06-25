//
//  CategoryScreen.swift
//  muslimbd
//
//  Created by Al Faruk on 12/1/25.
//

import SwiftUI

struct ParaScreen: View {
    let category: CategoryDtoItem
    let surah: AllParaDtoItem
    
    @Environment(\.dismiss) var dismiss
    
    @StateObject var viewmodel = ParaViewModel()
    
    let width = UIScreen.main.bounds.width / 1.75
    
    
    var body: some View {
        let state = viewmodel.state
        
        NavigationStack {
            
            VStack (alignment: .leading){
                HStack{
                    VStack(alignment: .leading){
                        Text("পারা - \(englishToBengaliNumber(number: String(surah.sequenceNo ?? 0)))").font(.system(size: 16)).fontWeight(.medium).foregroundColor(Color.gray).fontWeight(.medium)
                        Spacer().frame(height: 2)
                        Text(surah.name ?? "").foregroundColor(Color.gray).lineLimit(1)
                    }
                    Spacer()
                    Image(systemName: "chevron.down").resizable().frame(width: 12, height: 8).foregroundStyle(Color.primary)
                }.padding(15).background(Color.white)
                
                ScrollView{
                    LazyVStack{
                        
                        ForEach(state.surah.data ?? [], id: \.id){ (item: ParaDtoItem) in
                            VStack (alignment: .leading){
                                Text(item.textInArabic ?? "").foregroundColor(Color.gray).fontWeight(.medium)
                                Spacer().frame(height: 5)
                                Text(item.text ?? "").foregroundColor(Color.primary)
                                Divider()
                                HStack{
                                    Text(englishToBengaliNumber(number: String(item.sequenceNo ?? 0)) + " / " + englishToBengaliNumber(number: String(state.surah.data?.count ?? 0))).font(.system(size: 12))
                                }
                            }.padding(10).background(Color.backgroundDark).clipShape(RoundedRectangle(cornerRadius: 10)).padding(.horizontal, 10).padding(.vertical, 5)
                        }
                        
                        Spacer().frame(height: 20)
                        
                    }.padding(.horizontal, 10)
                    
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
                viewmodel.initiate(category: category, surah: surah)
            })
        
    }
}


#Preview {
    ParaScreen(category: CategoryDtoItem(name: "Category", icon: .home), surah: AllParaDtoItem())
}
