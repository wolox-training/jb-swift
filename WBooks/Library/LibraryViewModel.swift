//
//  MainMenuViewModel.swift
//  WBooks
//
//  Created by joaquin bozzalla on 12/04/2021.
//

import UIKit

final class LibraryViewModel: BooksTableViewModel {
    private let bookRepository: BookRepositoryType
    
    init(bookRepository: BookRepositoryType = BookRepository()) {
        self.bookRepository = bookRepository
    }

    override func fetchData(onSuccess: @escaping () -> Void, onError: @escaping (Error) -> Void) {
        let onFetchSuccess = { [weak self] (books: [Book]) in
            self?.books = books
            onSuccess()
        }
        bookRepository.fetchBooks(onSuccess: onFetchSuccess, onError: onError)
    }
}
