//
//  BooksTableViewModel.swift
//  WBooks
//
//  Created by joaquin bozzalla on 20/04/2021.
//

protocol BooksTableViewModelType {
    var books: [Book] { get set }
    var numberOfBooks: Int { get }
    func createBookCellViewModel(for bookIndex: Int) -> BookCellViewModel
    func createBookDetailsViewModel(bookId: Int) -> BookDetailsViewModel
    func fetchData(onSuccess: @escaping () -> Void, onError: @escaping (Error) -> Void)
}

class BooksTableViewModel: BooksTableViewModelType {
    internal var books: [Book] = [];
    
    var numberOfBooks: Int {
        books.count
    }

    func createBookCellViewModel(for bookIndex: Int) -> BookCellViewModel {
        return BookCellViewModel(book: books[bookIndex])
    }
    
    func createBookDetailsViewModel(bookId: Int) -> BookDetailsViewModel {
        return BookDetailsViewModel(book: books[bookId])
    }
    
    func fetchData(onSuccess: @escaping () -> Void, onError: @escaping (Error) -> Void) {
        fatalError("Not implemented")
    }
}
