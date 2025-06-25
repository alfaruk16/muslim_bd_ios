//
//  Tasbeeh.swift
//  muslimbd
//
//  Created by Al Faruk on 19/1/25.
//

import SwiftUI

struct Tasbeeh: View {
    let count: Float
    let tashbeeh: Float
    
    var body: some View {
        let width = UIScreen.main.bounds.width / 5 * 3
        let startAngle: Angle = .degrees(-90)
        let swapAngle: Angle = .degrees(Double(count / tashbeeh) * 360)
        
        ZStack(alignment: .center) {
            Circle()
                .stroke(Color.gray.opacity(0.2), style: StrokeStyle(lineWidth: 10, lineCap: .round, dash: [15, 15]))
                .frame(width: width, height: width)
            
            Arc(startAngle: startAngle + swapAngle, endAngle: startAngle, clockwise: true)
                .stroke(Color.primary, style: StrokeStyle(lineWidth: 10, lineCap: .round))
                .frame(width: width, height: width)
            
            Image(.tasbihBackground)
                .resizable()
                .scaledToFit()
                .frame(width: width - 30, height: width - 30)
            
            VStack(spacing: 8) {
                Text("\(Int(count))")
                    .font(.system(size: 40, weight: .bold))
                    .foregroundColor(.white)
                
                Text("Tasbeeh \(Int(tashbeeh))")
                    .font(.system(size: 12))
                    .foregroundColor(.white)
            }
        }
    }
}

struct Arc: Shape {
    let startAngle: Angle
    let endAngle: Angle
    let clockwise: Bool
    
    func path(in rect: CGRect) -> Path {
        var path = Path()
        path.addArc(center: CGPoint(x: rect.midX, y: rect.midY), radius: rect.width / 2, startAngle: startAngle, endAngle: endAngle, clockwise: clockwise)
        return path
    }
}

#Preview {
    Tasbeeh(count: 5.0, tashbeeh: 33.0)
}
