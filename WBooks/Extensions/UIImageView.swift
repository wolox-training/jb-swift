//
//  UIImageView.swift
//  WBooks
//
//  Created by joaquin bozzalla on 13/04/2021.
//

import UIKit

extension UIImageView {
    
    public func loadFromURL(url: URL) {
        DispatchQueue.global().async {
            if let data = try? Data(contentsOf: url) {
                DispatchQueue.main.async {
                    self.image = UIImage(data: data)
                }
            }
        }
    }
    
    public func loadFromURL(stringURL: String) {
        if let url = URL(string: stringURL) {
            self.loadFromURL(url: url)
        }
    }
}
