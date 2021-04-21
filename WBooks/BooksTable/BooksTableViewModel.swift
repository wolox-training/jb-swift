//
//  BooksTableViewModel.swift
//  WBooks
//
//  Created by joaquin bozzalla on 20/04/2021.
//

protocol BooksTableViewModelType {
    var books: [Book] { get set }
    var numberOfBooks: Int { get }
    func getBookBy(index: Int) -> Book
    func createBookCellViewModel(for bookIndex: Int) -> BookCellViewModel
    func fetchData(onSuccess: @escaping () -> Void, onError: @escaping (Error) -> Void)
}

class BooksTableViewModel: BooksTableViewModelType {
    internal var books: [Book] = [];

    var numberOfBooks: Int {
        books.count
    }
    
    func getBookBy(index: Int) -> Book {
        books[index]
    }
    
    func createBookCellViewModel(for bookIndex: Int) -> BookCellViewModel {
        return BookCellViewModel(book: books[bookIndex])
    }
    
    func fetchData(onSuccess: @escaping () -> Void, onError: @escaping (Error) -> Void) {
        fatalError("Not implemented")
    }
}
