//
//  BookCellViewModel.swift
//  WBooks
//
//  Created by joaquin bozzalla on 12/04/2021.
//

final class BookCellViewModel {
    private let _book: Book
    
    init(book: Book) {
        self._book = book
    }
    
    var title: String {
        return _book.title
    }
    var author: String {
        return _book.author
    }
    var imageName: String? {
        return _book.imageName
    }
}
