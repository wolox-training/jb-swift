//
//  MainMenuViewModel.swift
//  WBooks
//
//  Created by joaquin bozzalla on 12/04/2021.
//

import UIKit

final class LibraryViewModel {
    private var _books: [Book] = [];
    private let bookRepository = BookRepository()
    
    var numberOfBooks: Int {
        return _books.count
    }
    
    func getBookBy(index: Int) -> Book {
        return _books[index]
    }
    
    func createBookCellViewModel(for bookIndex: Int) -> BookCellViewModel {
        return BookCellViewModel(book: _books[bookIndex])
    }
    
    func fetchBooks(onSuccess: @escaping () -> Void, onError: @escaping (Error) -> Void) {
        let onFetchSuccess = { (books: [Book]) in
            self._books = books
            onSuccess()
        }
        bookRepository.fetchBooks(onSuccess: onFetchSuccess, onError: onError)
    }
}
