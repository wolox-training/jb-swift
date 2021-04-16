//
//  UIImageView.swift
//  WBooks
//
//  Created by joaquin bozzalla on 13/04/2021.
//

import UIKit

extension UIImageView {
    
    func loadFromURL(url: URL, or defaultImage: UIImage? = UIImage.defaultImage) {
        DispatchQueue.global().async {
            if let data = try? Data(contentsOf: url) {
                DispatchQueue.main.async {
                    self.image = UIImage(data: data)
                }
            } else {
                self.image = defaultImage
            }
        }
    }
    
    func loadFromURL(stringURL: String, or defaultImage: UIImage? = UIImage.defaultImage) {
        if let url = URL(string: stringURL) {
            self.loadFromURL(url: url, or: defaultImage)
        } else if let image = defaultImage {
            self.image = image
        }
    }
    
    func setRounded() {
        let radius = self.frame.width / 2
        self.layer.cornerRadius = radius
        self.layer.masksToBounds = true
    }
}
