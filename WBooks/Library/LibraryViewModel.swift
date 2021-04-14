//
//  MainMenuViewModel.swift
//  WBooks
//
//  Created by joaquin bozzalla on 12/04/2021.
//

import UIKit

final class LibraryViewModel {
    private var books: [Book] = [];
    private let bookRepository = BookRepository()
    
    var numberOfBooks: Int {
        return books.count
    }
    
    func createBookCellViewModel(for bookIndex: Int) -> BookCellViewModel {
        return BookCellViewModel(book: books[bookIndex])
    }
    
    func fetchBooks(onSuccess: @escaping () -> Void, onError: @escaping (Error) -> Void) {
        let onFetchSuccess = { (books: [Book]) in
            self.books = books
            onSuccess()
        }
        bookRepository.fetchBooks(onSuccess: onFetchSuccess, onError: onError)
    }
}
