//
//  ZakatDialog.swift
//  muslimbd
//
//  Created by Al Faruk on 23/1/25.
//

import SwiftUI

struct ZakatDialog: View {
    let total: String
    let zakat: String
    
    var body: some View {
        VStack{
            Image(.logoPrimary).resizable().frame(width: 100, height: 100)
            Text("মোট সম্পদ: \(total)").font(.system(size: 15)).foregroundColor(Color.primary).padding(.top, 10).padding(.bottom, 10)
            Text("যাকাত বাকী: \(zakat)").font(.system(size: 15)).foregroundColor(Color.primary)
        }
    }
}
