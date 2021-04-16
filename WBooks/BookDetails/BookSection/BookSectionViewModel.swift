//
//  BookSectionViewModel.swift
//  WBooks
//
//  Created by joaquin bozzalla on 14/04/2021.
//

final class BookSectionViewModel {
    var book: Book
    private let rentRepository = RentRepository()
    
    init(book: Book) {
        self.book = book
    }
    
    func rentBook(onSuccess: @escaping () -> Void, onError: @escaping (Error) -> Void) {
        let onRentSuccess = { (rentResponse: Rent) in
            self.book.setUnavailable()
            onSuccess()
        }
        rentRepository.rentBook(userId: 9, bookId: book.id, onSuccess: onRentSuccess, onError: onError)
    }
}
