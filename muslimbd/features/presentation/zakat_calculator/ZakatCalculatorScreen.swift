//
//  ZakatCalculatorScreen.swift
//  muslimbd
//
//  Created by Al Faruk on 22/1/25.
//

import SwiftUI

struct ZakatCalculatorScreen: View {
    let category: CategoryDtoItem
    
    @Environment(\.dismiss) var dismiss
    
    @StateObject var viewmodel = ZakatCalculatorViewModel()
    
    let width = UIScreen.main.bounds.width
    @State private var nagadTaka: String = ""
    @State private var bankTaka: String = ""
    @State private var shornoTaka: String = ""
    @State private var rupaTaka: String = ""
    @State private var shareBazarTaka: String = ""
    @State private var onnannoBiniog: String = ""
    @State private var bashaVara: String = ""
    @State private var shompotti: String = ""
    @State private var nagadBabsha: String = ""
    @State private var ponno: String = ""
    @State private var pension: String = ""
    @State private var paribarikRin: String = ""
    @State private var onnannoMuldhon: String = ""
    @State private var krishi: String = ""
    @State private var creditCard: String = ""
    @State private var gariPayment: String = ""
    @State private var babshaPayment: String = ""
    @State private var familyRin: String = ""
    @State private var onnannoRin: String = ""
    
    @State var showPopUp: Bool = false
    
    
    var body: some View {
        let state = viewmodel.state
        
        NavigationStack {
            
            ZStack {
                
                ScrollView {
                    
                    Image(.zakatCalculatorBanner).resizable().background(Color.primary).frame(width: width).clipShape(.rect(
                        bottomLeadingRadius: 20, bottomTrailingRadius: 20
                    ))
                    
                    LazyVStack (alignment: .leading){
                        Text(Language.chandra_bosore).foregroundColor(Color.gray).font(.system(size: 16))
                        Spacer().frame(height: 20)
                        
                        Text("নগদ টাকা").font(.system(size: 18)).fontWeight(.medium).foregroundColor(Color.gray)
                        
                        ZakatItem(title: "নগদ টাকা", amount: $nagadTaka)
                        ZakatItem(title: "ব্যাংক অ্যাকাউন্টে নগদ টাকা", amount: $bankTaka)
                        
                        Text("স্বর্ণের সমতুল্য টাকার পরিমান").font(.system(size: 18)).fontWeight(.medium).foregroundColor(Color.gray).padding(.top, 10)
                        ZakatItem(title: "স্বর্ণ", amount: $shornoTaka)
                        ZakatItem(title: "রুপা", amount: $rupaTaka)
                        
                        Text("বিনিয়োগ").font(.system(size: 18)).fontWeight(.medium).foregroundColor(Color.gray).padding(.top, 10)
                        ZakatItem(title: "শেয়ার বাজার", amount: $shareBazarTaka)
                        ZakatItem(title: "অন্যান্য বিনিয়োগ", amount: $onnannoBiniog)
                        
                        Text("সম্পত্তি").font(.system(size: 18)).fontWeight(.medium).foregroundColor(Color.gray).padding(.top, 10)
                        ZakatItem(title: "বাসা ভাড়া", amount: $bashaVara)
                        ZakatItem(title: "সম্পত্তি", amount: $shompotti)
                        
                        Text("ব্যবসা").font(.system(size: 18)).fontWeight(.medium).foregroundColor(Color.gray).padding(.top, 10)
                        ZakatItem(title: "নগদ ব্যবসা", amount: $nagadBabsha)
                        ZakatItem(title: "পণ্য", amount: $ponno)
                        
                        Text("অন্যান্য").font(.system(size: 18)).fontWeight(.medium).foregroundColor(Color.gray).padding(.top, 10)
                        ZakatItem(title: "পেনশন", amount: $pension)
                        ZakatItem(title: "পারিবারিক ঋণ এবং অন্যান্য", amount: $paribarikRin)
                        ZakatItem(title: "অন্যান্য মূলধন", amount: $onnannoMuldhon)
                        
                        Text("কৃষিকাজ").font(.system(size: 18)).fontWeight(.medium).foregroundColor(Color.gray).padding(.top, 10)
                        ZakatItem(title: "টাকার পরিমান", amount: $krishi)
                        
                        Text("দায়").font(.system(size: 18)).fontWeight(.medium).foregroundColor(Color.red).padding(.top, 10)
                        ZakatItem(title: "ক্রেডিট কার্ড পেমেন্ট", amount: $creditCard)
                        ZakatItem(title: "গাড়ির পেমেন্ট", amount: $gariPayment)
                        ZakatItem(title: "ব্যবসার পেমেন্ট", amount: $babshaPayment)
                        ZakatItem(title: "ফ্যামিলি ঋণ", amount: $familyRin)
                        ZakatItem(title: "অন্যান্য ঋণ", amount: $onnannoRin)
                        
                        Spacer().frame(height: 10)
                        Button(action: {
                            viewmodel.calculate(nagadTaka: nagadTaka, bankTaka: bankTaka, shornoTaka: shornoTaka, rupaTaka: rupaTaka, shareBazarTaka: shareBazarTaka, onnannoBiniog: onnannoBiniog, bashaVara: bashaVara, shompotti: shompotti, nagadBabsha: nagadBabsha, ponno: ponno, pension: pension, paribarikRin: paribarikRin, onnannoMuldhon: onnannoMuldhon, krishi: krishi, creditCard: creditCard, gariPayment: gariPayment, babshaPayment: babshaPayment, familyRin: familyRin, onnannoRin: onnannoRin)
                            showPopUp = true
                        }){
                            Text(Language.hishab_korun).foregroundColor(Color.white).padding(10)
                        }.frame(maxWidth: .infinity).background(Color.primary).cornerRadius(10)
                        
                    }.padding(15)
                }.background(Color.backgroundColor).frame(maxHeight: .infinity, alignment: .top)
                    .navigationBarTitleDisplayMode(.inline)
                    .toolbar{
                        ToolbarItem(placement: .principal) {
                            AppBar(title: category.name ?? "", icon: category.icon, image: (category.contentBaseURL ?? "") + (category.imageURL ?? ""), dismiss: { dismiss() })
                        }
                    }
                
                if(showPopUp){
                    Popup(isPresented: $showPopUp){
                        ZakatDialog(total: state.total, zakat: state.zakat)
                    }
                }
            }
        }.navigationBarBackButtonHidden(true)
        
    }
}


#Preview {
    ZakatCalculatorScreen(category: CategoryDtoItem(name: "Category", icon: .home))
}
