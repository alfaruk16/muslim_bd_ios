//
//  AppBar.swift
//  muslimbd
//
//  Created by Al Faruk on 24/11/24.
//

import SwiftUI

struct AppBar: View {
    var title: String
    var icon: ImageResource?
    var image: String?
    var isBack: Bool = true
    var dismiss: () -> ()
    
    var body: some View {
        HStack(alignment: .center){
            
            if(isBack){
                Button(action: { dismiss() }) {
                    HStack {
                        Image(systemName: "chevron.left").foregroundColor(.primary)
                    }
                }
            }
            if(icon != nil){
                Image(icon ?? .logo).resizable().frame(width: 24, height: 24).padding(5)
            }
            else if(image != nil){
                AsyncImage(url: URL(string: image ?? "")) { image in
                    image
                        .resizable()
                        .scaledToFit()
                        .frame(width: 24, height: 24)
                } placeholder: {
                    ProgressView()
                }
            }
            
            Text(title).font(.system(size: 18)).foregroundColor(.gray).fontWeight(.semibold)
            
            Spacer()
        }.padding(10)
    }
}

#Preview {
    AppBar(title: "Title", icon: .logo, dismiss: {})
}
