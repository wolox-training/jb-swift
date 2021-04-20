//
//  NewBookViewModel.swift
//  WBooks
//
//  Created by joaquin bozzalla on 19/04/2021.
//

import Foundation

final class NewBookViewModel {
    private let bookRepository: BookRepositoryType
    
    init(bookRepository: BookRepositoryType = BookRepository()) {
        self.bookRepository = bookRepository
    }
    
    func loadBook(book: UnidentifiableBook, onSuccess: @escaping (Book) -> Void, onError: @escaping (Error) -> Void) {
        if book.isValid() {
            bookRepository.uploadBook(book: book, onSuccess: onSuccess, onError: onError)
        }
    }
}
