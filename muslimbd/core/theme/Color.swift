//
//  Color.swift
//  muslimbd
//
//  Created by Al Faruk on 25/11/24.
//
import SwiftUI

extension Color {
    static var primary: Color {
        return Color(hex: "006241")
    }
    static var backgroundColor: Color{
        return primary.opacity(0.02)
    }
    static var backgroundDark: Color{
        return Color(hex: "E9F3F3")
    }
    static var greenLight: Color{
        return Color(hex: "D4E9E2")
    }
    static var gray: Color{
        return Color(hex: "22292F")
    }
    static var grayLight: Color{
        return Color(hex: "6B6B6B")
    }
    static var grayLightExtra: Color{
        return Color(hex: "DDDDDD")
    }
    static var gradientColor1: Color{
        return Color(hex: "D4E9E2")
    }
    static var gradientColor2: Color{
        return Color(hex: "B6CBD5")
    }
    static var amberColor: Color{
        return Color(hex: "EED350")
    }
    static var textGradientColor: Color{
        return Color(hex: "D7F1E5")
    }
    static var textGradientColor2: Color{
        return Color(hex: "D7E9F1")
    }
    static var orangeLight: Color{
        return Color(hex: "EC7157")
    }
    static var ramadanColor: Color{
        return Color(hex: "1E3932")
    }
    static var ramadanBackground: Color{
        return Color(hex: "B6CBD5")
    }
    static var ramadanDateBackground: Color{
        return Color(hex: "F2F0EB")
    }
    static var golden: Color{
        return Color(hex: "FFD700")
    }
    static var orange: Color{
        return Color(hex: "D84315")
    }
    static var textFieldBackground: Color{
        return Color(hex: "F8F9FE")
    }
    
    
    init(hex: String) {
        let hex = hex.trimmingCharacters(in: .alphanumerics.inverted)
        var int: UInt64 = 0
        Scanner(string: hex).scanHexInt64(&int)
        let a, r, g, b: UInt64
        switch hex.count {
            case 3: // RGB(12 -bit)
                (a, r, g, b) = (255, (int >> 8) * 17, (int >> 4 & 0xF) * 17, (int & 0xF) * 17)
            case 6: // RGB (24-bit)
                (a, r, g, b) = (255, int >> 16, int >> 8 & 0xFF, int & 0xFF)
            case 8: // ARGB (32-bit)
                (a, r, g, b) = (int >> 24, int >> 16 & 0xFF, int >> 8 & 0xFF, int & 0xFF)
            default:
                (a, r, g, b) = (1, 1, 1, 0)
        }
        
        self.init(
            .sRGB,
            red: Double(r) / 255,
            green: Double(g) / 255,
            blue:  Double(b) / 255,
            opacity: Double(a) / 255
        )
    }
    
}
