//
//  BookSectionViewModel.swift
//  WBooks
//
//  Created by joaquin bozzalla on 14/04/2021.
//

final class BookSectionViewModel {
    private var book: Book
    private let rentRepository = RentRepository()
    
    var title: String {
        return book.title
    }
    var author: String {
        return book.author
    }
    var year: String {
        return book.year
    }
    var genre: String {
        return book.genre
    }
    var image: String {
        return book.image
    }
    var isBookAvailable: Bool {
        return book.isAvailable
    }
    
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
