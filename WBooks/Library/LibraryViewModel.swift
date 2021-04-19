//
//  MainMenuViewModel.swift
//  WBooks
//
//  Created by joaquin bozzalla on 12/04/2021.
//

import UIKit

final class LibraryViewModel {
    private var books: [Book] = [];
    private let bookRepository: BookRepositoryType
    
    init(bookRepository: BookRepositoryType = BookRepository()) {
        self.bookRepository = bookRepository
    }
    
    var numberOfBooks: Int {
        return books.count
    }
    
    func getBookBy(index: Int) -> Book {
        return books[index]
    }
    
    func createBookCellViewModel(for bookIndex: Int) -> BookCellViewModel {
        return BookCellViewModel(book: books[bookIndex])
    }
    
    func fetchBooks(onSuccess: @escaping () -> Void, onError: @escaping (Error) -> Void) {
        let onFetchSuccess = { [weak self] (books: [Book]) in
            self?.books = books
            onSuccess()
        }
        bookRepository.fetchBooks(onSuccess: onFetchSuccess, onError: onError)
    }
}
