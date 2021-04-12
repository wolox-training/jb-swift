//
//  Book.swift
//  WBooks
//
//  Created by joaquin bozzalla on 12/04/2021.
//

final class Book {
    let title: String
    let author: String
    let imageName: String?
    
    init(title: String, author: String, imageName: String?) {
        self.title = title
        self.author = author
        self.imageName = imageName
    }
}
