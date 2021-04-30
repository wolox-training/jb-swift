//
//  BookCellViewModel.swift
//  WBooks
//
//  Created by joaquin bozzalla on 12/04/2021.
//

final class BookCellViewModel {
    private let book: Book
    
    init(book: Book) {
        self.book = book
    }
    
    var title: String {
        return book.title
    }
    var author: String {
        return book.author
    }
    var image: String {
        return book.image
    }
}
