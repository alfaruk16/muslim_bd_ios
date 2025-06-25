//
//  UINavigationController.swift
//  muslimbd
//
//  Created by Al Faruk on 30/12/24.
//

import SwiftUI
import Foundation

extension UINavigationController {
    override open func viewDidLoad() {
        super.viewDidLoad()
        
        let standard = UINavigationBarAppearance()
        standard.backgroundColor = UIColor(Color.backgroundColor) //When you scroll or you have title (small one)
        
        let compact = UINavigationBarAppearance()
        compact.backgroundColor = UIColor(Color.white) //compact-height
        
        let scrollEdge = UINavigationBarAppearance()
        scrollEdge.backgroundColor = UIColor(Color.white) //When you have large title
        
        navigationBar.standardAppearance = standard
        navigationBar.compactAppearance = compact
        navigationBar.scrollEdgeAppearance = scrollEdge
        
        UINavigationBar.appearance().tintColor = UIColor(Color.black)
        
        //UIView.appearance().backgroundColor = UIColor.red
    }
}
