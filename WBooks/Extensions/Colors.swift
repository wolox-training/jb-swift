//
//  Colors.swift
//  WBooks
//
//  Created by joaquin bozzalla on 12/04/2021.
//

import UIKit

extension UIColor {
    static let backgroundColor = UIColor(red: 0.92, green: 0.96, blue: 0.98, alpha: 1)
    static let navBarColor = UIColor(
        red: 0/255.0,
        green: 173/255.0,
        blue: 238/255.0,
        alpha: 1)
    
    public convenience init?(hex: String) {
        let r, g, b, a: CGFloat
        
        if hex.hasPrefix("#") {
            let start = hex.index(hex.startIndex, offsetBy: 1)
            let hexColor = String(hex[start...])
            
            if hexColor.count == 8 {
                let scanner = Scanner(string: hexColor)
                var hexNumber: UInt64 = 0
                
                if scanner.scanHexInt64(&hexNumber) {
                    r = CGFloat((hexNumber & 0xff000000) >> 24) / 255
                    g = CGFloat((hexNumber & 0x00ff0000) >> 16) / 255
                    b = CGFloat((hexNumber & 0x0000ff00) >> 8) / 255
                    a = CGFloat(hexNumber & 0x000000ff) / 255
                    
                    self.init(red: r, green: g, blue: b, alpha: a)
                    return
                }
            }
        }
        
        return nil
    }
}
